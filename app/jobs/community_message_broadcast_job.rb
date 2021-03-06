class CommunityMessageBroadcastJob < ApplicationJob
  queue_as :default

   def perform(message)
     ActionCable.server.broadcast 'community_channel', message:  render_message(message)

   end

   private

   def render_message(message)
     user_name = User.find_by(id:message.user_id).name
     ApplicationController.renderer.render(partial: 'communities/message', locals: { message: message, user_name: user_name})
   end
end
