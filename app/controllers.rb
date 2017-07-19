QuizPopsicle.controllers  do
  layout :main

  get :index do
    if logged_in?
      redirect :games
    else
      redirect :one
    end
  end

  #####
  # Signup

  get :one do
    session.clear
    render :one
  end

  post :one do
    session[:signup] = { :what => params["what"] }
    redirect :two
  end

  get :two do
    render :two
  end

  post :two do
    # removes blank and duplicate emails
    emails = params["emails"].delete_if {|x| x.empty? }.sort.uniq

    if emails.length >= 2
      session[:signup][:players] = emails
      redirect :three
    else
      # TODO: show warning
      render :two
    end
  end

  get :three do
    render :three
  end

  post :three do

    # Create User
    user = User.new
    user.name = params["name"]
    user.email = params["email"]
    user.generate_password
    user.save

    # User is now logged in.
    session[:user_id] = user.id

    keen_log 'signup', { :email => user.email, :action => :new_game }

    # Create Game
    game = Game.new
    game.add_player user.id
    session[:signup][:players].each do |email|
      game.add_player User.find_or_create_by_email(email).id
      # TODO: email players
      keen_log 'email', { :email => email, :action => :added_to_game }
    end

    game.new_round session[:signup][:what]
    game.save

    session[:signup].clear
    redirect :games
  end


  ##
  # Random stuff

  get :about do
    render :about
  end

  get :login do
    render :login
  end

  post :login do
    if !params['email'] or !params['password']
      redirect :login
    end

    @user = User.authenticate params['email'], params['password']

    if @user
      session[:user_id] = @user.id
      redirect :games
    else
      403
    end
  end

  get :logout do
    session.clear
    redirect :index
  end

  get :games do
    @user = current_user

    if @user.nil?
      redirect :login
    end

    @games = @user.games

    render :games
  end

  # /game/:id
  get :game, :with => :id do
    # if new game
    # * invite players
    # else if chooser
    # * status of submitters
    # * time left
    # * once everyone has submitted or time up Make a choice
    # else
    # * status of submitters (1 of x has submitted)
    # * submit your post

    @user = current_user
    @game = Game.find_by_id(params[:id])
    render :game
  end

  get :user do
    @user = current_user
    render :edit_user
  end

  post :user do
    @user = current_user

    @user.name = params[:name]
    @user.email = params[:email]
    @user.save

    redirect "/user/#{@user.name}"
  end

  # /user/:name
  #   * win stats
  #   * games played stats
  #   * "I've played games with"
  get :user, :with => :name do
    @user = User.where(:name => params[:name]).first
    render :user
  end
end
