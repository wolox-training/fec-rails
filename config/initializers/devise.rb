
Devise.setup do |config|
  require 'devise/orm/active_record'
  config.skip_session_storage = [:http_auth]
  #config.secret_key = '6e2fd1bfe55c29d0ac32696bf93117642ba5dd3d7c926812958692a6a4453e98f3c93756650e834b1d5315497e1d1732acf7734621cbe41e62ac6e973e94eb68'
end
