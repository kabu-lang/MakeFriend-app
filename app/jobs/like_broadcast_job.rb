class LikeBroadcastJob < ApplicationJob
  queue_as :default

  def perform(like_data)
    ActionCable.server.broadcast 'like_channel', like_receiver: like_data.receiver
  end
end
