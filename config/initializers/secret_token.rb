# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

 Collection::Application.config.secret_token = secure_token
#Collection::Application.config.secret_token = '673b169e82d3c91ae52e84576111421a43d3946fb3b4233101d4ed59d554165c31efe1aafecf66bd67c9e5b2dbfe44bcdf2eca0226503bbcbd3fde6beb2feee5'
