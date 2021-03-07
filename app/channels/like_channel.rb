class LikeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "like_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_like(like_data)
    Like.create!(receiver_id: like_data['receiver_id'], sender_id: like_data['sender_id'])
  end
end
