# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Dianewillis::Application.config
  .secret_token = if Rails.env == 'production'
                    ENV['RAILS_SECRET_TOKEN']
                  else
                    '1f9458216add18ce3ac22a49158367a59ea9d4d1a2'\
                    '9e601bd1bfa8b811bd59c24635ce3e731b7f6d10b0'\
                    '800c35bb2fdb4f3159f7ba2981333a93f1faf9cb6966'
                  end
