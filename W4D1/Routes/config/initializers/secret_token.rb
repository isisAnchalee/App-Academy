# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Routes::Application.config.secret_key_base = '87d06bdf21d0a6af21180955a924e0044c809b19c7d872b9ac1f688b3aec26e28a633fa0bd7931862084cbbaaa699d3503ba92fb1a9053659ef0477287c557f8'
