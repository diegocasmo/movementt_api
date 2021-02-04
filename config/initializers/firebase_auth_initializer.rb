FirebaseIdToken.configure do |config|
  config.redis = Redis.new(url: ENV['REDIS_URL'])
  config.project_ids = [ENV['FIREBASE_PROJECT_ID']]
end
