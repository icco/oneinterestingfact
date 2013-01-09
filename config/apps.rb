##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  SESSION_SECRET = ENV['SESSION_SECRET'] || '6106be7965a6740a963141327efb4875809866efb584d32dbf32332e57d41364' 
  set :session_secret, SESSION_SECRET
end

# Mounts the core application for this project
Padrino.mount("QuizPopsicle").to('/')
