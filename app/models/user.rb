class User < ActiveRecord::Base

  validates :user_name, :email, :password, presence: true
  validates :email, format: { with: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/, :multiline => true }
  validates :email, uniqueness: { case_sensitive: false }

  has_secure_password

  has_many :articles, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :galleries, dependent: :destroy

  class << self

    def new_remember_token
      SecureRandom.urlsafe_base64
    end

    def encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

  end

end
