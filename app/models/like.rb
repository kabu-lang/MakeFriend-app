class Like < ApplicationRecord

# いいねが誰から送られたか
belongs_to :sender, class_name: 'User'
# いいねが誰に送られたか
belongs_to :receiver, class_name: 'User'

after_create_commit { LikeBroadcastJob.perform_later self }
after_destroy { LikeCancelBroadcastJob.perform_later self }

end
