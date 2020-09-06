class User < ApplicationRecord
  has_many :stores, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  before_save   :downcase_email
  has_secure_password

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
