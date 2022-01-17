class User < ApplicationRecord
  has_secure_password

  validates :email, :full_name, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
