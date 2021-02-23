class User < ApplicationRecord
mount_uploader :image_name, ImageNameUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
  has_many :category_users, dependent: :destroy
  has_many :categories, through: :category_users
  has_many :user_communities, dependent: :destroy
  has_many :communities, through: :user_communities
  accepts_nested_attributes_for :category_users, allow_destroy: true
  accepts_nested_attributes_for :user_communities, allow_destroy: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :name, presence: true, length: { maximum: 20 }, on: :update
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, on: :create
  validates :birthday, presence: true, on: :update
  validates :area, presence: true, on: :update
  validates :gender, presence: true, on: :update
  validates :remarks, presence: true, on: :update
  validate :category_exit, on: :update

  enum area: {
     "---":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
   }

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
