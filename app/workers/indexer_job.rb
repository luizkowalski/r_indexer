class IndexerJob
  include Sidekiq::Worker

  def perform
    IndexParser.start
  end
end
