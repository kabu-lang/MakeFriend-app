class Community < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities
end
