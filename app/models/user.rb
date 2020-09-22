class User < ApplicationRecord
  has_many :stores, dependent: :destroy
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  before_save   :downcase_email
  has_secure_password
  validates :password, presence: true, length: { minimum: 7 }

  def downcase_email
    self.email = email.downcase
  end

  def self.authenticate_with_credentials(email, pass)
    user = User.find_by_email(email.downcase.strip)
    if user
      user.authenticate(pass)
    end
  end
  
end
