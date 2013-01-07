##
# Mailer methods can be defined using the simple format:
#
# email :registration_email do |name, user|
#   from 'admin@site.com'
#   to   user.email
#   subject 'Welcome to the site!'
#   locals  :name => name
#   content_type 'text/html'       # optional, defaults to plain/text
#   via     :sendmail              # optional, to smtp if defined, otherwise sendmail
#   render  'registration_email'
# end
QuizPopsicle.mailer :notifier do
  email :registration_email do |user|
    from 'nat@quizpopsicle.com'
    to   user.email
    subject 'Welcome to the site!'
    locals  :name => name
    content_type 'text/html'       # optional, defaults to plain/text
    render  'registration_email'
  end
end
