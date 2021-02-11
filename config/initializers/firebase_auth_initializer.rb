FirebaseIdToken.configure do |config|
  config.redis = Redis.new(url: ENV['REDIS_TLS_URL'])
  config.project_ids = [ENV['FIREBASE_PROJECT_ID']]
end
