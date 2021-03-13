# broadcastがうまく動かないのでlike_cancel_channel.rbから直接broadcast
# class LikeCancelBroadcastJob < ApplicationJob
#   queue_as :default
#
#   def perform(like_data)
#     ActionCable.server.broadcast 'like_cancel_channel', like_data: like_data
#   end
#
# end
