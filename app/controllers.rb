QuizPopsicle.controllers  do
  layout :main

  # /
  #   * Signup, Gameplay
  get :index do
    render :index
  end

  get :about do
    render :about
  end

  # /login
  #   * sign in w/ email
  get :login do
    render :login
  end

  post :login do
    p params

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

  # /games
  #   * start new game
  #   * status of all current games
  get :games do
    render :games
  end

  get :new_game, :map => '/game/new' do
    render :new_game
  end

  post :new_game, :map => '/game/new' do

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
    @game = Game.get(params[:id])
    render :game
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
