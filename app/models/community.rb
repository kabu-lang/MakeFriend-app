class Community < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities

  validates :name , presence: true, length: { maximum: 45 }
  validates :prefecture_id, presence: true
  validates :municipality, presence: true,length: { maximum: 15 }
  validates :area_detail, presence: true,length: { maximum: 45 }
  validates :max_people, presence: true, inclusion: { in: 2..50 }
  validates :participation_people, presence: true
  validates :category, presence: true
end
