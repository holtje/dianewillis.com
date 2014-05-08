# Heroku doesn't support email, so we are doing an end-run directly to google.
# This means all "To:" addresses need to be @gmail.com accounts.
ActionMailer::Base.smtp_settings = {
  address: 'gmail-smtp-in.l.google.com',
  port: 25,
  domain: 'dianewillis.com',
  enable_starttls_auto: false
}
