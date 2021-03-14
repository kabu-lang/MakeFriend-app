class Community < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities
  belongs_to :category
  has_many  :community_messages
  validates :name , presence: true, length: { maximum: 45 }
  validates :prefecture_id, presence: true
  validates :municipality, presence: true,length: { maximum: 15 }
  validates :area_detail, presence: true,length: { maximum: 45 }
  validates :max_people, presence: true, inclusion: { in: 2..50 }
  validates :participation_people, presence: true
  
 enum status: [:looking_for_member, :max_number_of_people]


# :deadline_has_passed,
end
