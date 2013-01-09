# Helper methods defined here can be accessed in any controller or view in the
# application

QuizPopsicle.helpers do
  def logged_in?
    return !session[:user_id].nil? && session[:user_id] > 0
  end
end
