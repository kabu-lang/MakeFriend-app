class CommunityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "community_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message_data)
     CommunityMessage.create!(content: message_data['content'],user_id: message_data['user_id'],community_id: message_data['community_id'])
  end
end
