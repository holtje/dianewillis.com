# We want to be emailed on errors
Dianewillis::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[DianeWillis] ",
  :sender_address => %{"notifier" <notifier@dianewillis.com>},
  :exception_recipients => %w{docwhat@gmail.com}
