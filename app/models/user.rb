class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  mount_uploader :image_name, ImageNameUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
  has_many :category_users, dependent: :destroy
  has_many :categories, through: :category_users
  has_many :user_communities, dependent: :destroy
  has_many :communities, through: :user_communities
  has_many :created_communities, class_name: "Community", foreign_key: :author
  # has_many :likes
  # has_many :receivers, through: :likes, source: :sender
  # has_many :senders, class_name: "Like", foreign_key: :receiver_id
  # has_many :like_receivers, class_name: "Like", foreign_key: :receiver_id
  # has_many :receivers, through: :likes, source:　

  # 自分が送ったいいねと、送った側(自分)のIDを紐付けている
  has_many :sended_likes, class_name: "Like", foreign_key: "sender_id", dependent: :destroy
  # 時文が受け取ったいいねと、受け取った側(相手)のIDを紐付けている
  has_many :received_likes, class_name: "Like", foreign_key: "receiver_id", dependent: :destroy

  accepts_nested_attributes_for :category_users, allow_destroy: true
  accepts_nested_attributes_for :user_communities, allow_destroy: true
  has_one_attached :image

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :name, presence: true, length: { maximum: 20 }, on: :update
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, on: :create
  validates :birthday, presence: true, on: :update
  validates :prefecture_id, presence: true, on: :update
  validates :gender, presence: true, on: :update
  validates :remarks, presence: true, on: :update
  validate  :category_exit, on: :update

  scope :except_current_user, -> (current_user_id) {where.not(id:current_user_id)}


   def update_without_current_password(params, *options)
     params.delete(:current_password)

     if params[:password].blank? && params[:password_confirmation].blank?
       params.delete(:password)
       params.delete(:password_confirmation)
     end
     result = update_attributes(params, *options)
     clean_up_passwords
     result
   end

private

    def category_exit
      if self.categories.length < 1
        errors.add(:category, '選択してください')
      elsif self.categories.length > 3
        errors.add(:category, '最大で3つまでしか選択できません')
      end
    end



end
