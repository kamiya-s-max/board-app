class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :experts, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  
  # validation_format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{7,128}+\z/i

  # validation
  # nickname 空ではないか、一意の値か、最大10文字
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 10}
  # email 空ではないか、一意の値か、適切なフォーマットであるか
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "フォーマットが不適切です"}
  # password 空ではないか、7文字以上128文字以下、半角英数字両方含んでいるか
  validates :password, confirmation: true, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: "半角の英字と数字を両方含むパスワードを設定してください"}, unless: -> { validation_context == :update }
  # password_confirmation 空ではないか、7文字以上128文字以下、半角英数字両方含んでいるか
  validates :password_confirmation, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: "半角の英字と数字を両方含むパスワードを設定してください"}, unless: -> { validation_context == :update }
end
