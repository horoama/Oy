class User < ApplicationRecord
  attr_accessor :login
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following,  through: :active_relationships,  source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers,  through: :passive_relationships,  source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]

  validates :username,
    uniqueness: { case_sensitive: :false },
    length: { minimum: 4,  maximum: 20 },
    format: { with: /\A[a-z0-9]+\z/,  message: "ユーザー名は半角英数字です"}

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
        where(conditions).where(["username = :value OR lower(email) = lower(:value)",  { :value => login }]).first
    else
        where(conditions).first
    end
  end

  # ユーザーをフォローする
  def follow(other_user)
      active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
      following.include?(other_user)
  end
end
