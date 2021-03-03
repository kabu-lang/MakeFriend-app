class CommunityMessageBroadcastJob < ApplicationJob
  queue_as :default

   def perform(message)
     ActionCable.server.broadcast 'community_channel', message:  render_message(message)

   end

   private

   def render_message(message)
     ApplicationController.renderer.render(partial: 'communities/message', locals: { message: message })
   end
end
