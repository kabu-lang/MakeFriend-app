class LikeCancelChannel < ApplicationCable::Channel
  def subscribed
    stream_from "like_cancel_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def delete_like(like_data)
    like = Like.find_by(receiver_id: like_data['receiver_id'], sender_id: like_data['sender_id'])
    like.destroy!
  end
end
