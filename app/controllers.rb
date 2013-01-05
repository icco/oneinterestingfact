Onefact.controllers  do

  # * /
  #   * Signup, Gameplay
  get :index do
    render :index
  end

  # * /login
  #   * sign in w/ email
  get :login do
    render :login
  end

  post :login do
    404
  end

  # * /game
  #   * start new game
  #   * status of all current games
  get :game do
    404
  end

  # * /game/:id
  #   * if new game
  #     * invite players
  #   * else if chooser
  #     * status of submitters
  #     * time left
  #     * once everyone has submitted or time up Make a choice 
  #   * else
  #     * status of submitters (1 of x has submitted)
  #     * submit your post
  get :game, :with => :id do
    404
  end

  # * /user/:name
  #   * win stats
  #   * games played stats
  #   * "I've played games with"
  get :user, :with => :name do
    404
  end

end
