url = ENV['REDIS_URL'] || 'redis://127.0.0.1/2'

Sidekiq.configure_server do |config|
  config.redis = { url: url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: url }
end
