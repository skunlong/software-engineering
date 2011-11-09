# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_OASP_session',
  :secret      => 'aa3b9cc4c779597131a3a390fb1d569406bac072de3418caee8e41b08bb39ed398492a075d4f20bb029c8182e57df2dbbd64e018a768909ff8a183d17a20efd4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
