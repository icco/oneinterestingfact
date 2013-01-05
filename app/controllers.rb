Onefact.controllers  do
  layout :main

  # /
  #   * Signup, Gameplay
  get :index do
    render :index
  end

  # /login
  #   * sign in w/ email
  get :login do
    render :login
  end

  post :login do
    404
  end

  # /game
  #   * start new game
  #   * status of all current games
  get :game do
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
