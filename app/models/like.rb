class Like < ApplicationRecord
  
# 「いいね」が、いいねを送った側のユーザーを持つ
belongs_to :sender, class_name: "User"
# 「いいね」が、いいねを受け取った側を持つ
belongs_to :receiver, class_name: "User"
# 自分ががいいねをしたユーザーを持つ
has_many :like_receiver, through: :receiver, source: :sender
# 自分にいいねしたユーザーを持つ
has_many :like_sender, through: :sender, source: :receiver
end
