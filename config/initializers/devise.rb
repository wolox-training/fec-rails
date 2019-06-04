
Devise.setup do |config|
  require 'devise/orm/active_record'
  config.skip_session_storage = [:http_auth]
end
