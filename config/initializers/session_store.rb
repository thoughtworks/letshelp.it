# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_LetsHelpIt_session',
  :secret      => '023ca737a98e2f34ff5d42e99b2c3af96a7f1553596146c19acc3aff8bf03e288e839fec202e8e9ffb2b0dbda9f5d460feb2a4638d5e39c300e7f26599f3a54d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
