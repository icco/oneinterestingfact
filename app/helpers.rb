# Helper methods defined here can be accessed in any controller or view in the
# application

QuizPopsicle.helpers do
  def logged_in?
    return !session[:user_id].nil? && session[:user_id] > 0
  end

  def keen_log key, data
    if Padrino.env != :development
      keen = new Keen::Client.new(:project_id => ENV['KEEN_PROJECT_ID'],
                                  :api_key => ENV['KEEN_API_KEY'])
      keen.logger = Padrino.logger
      http = keen.publish_async(key, data)
    else
      logger.bench "Keen", Time.now, "#{key}: #{data.inspect}", :devel, :blue
    end
  end
end
