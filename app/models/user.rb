class User < ApplicationRecord
  before_create do
    generate_token(:auth_token)
  end
  has_secure_password
  validates :email, :username, presence: true

  private

  def generate_token(col)
    loop do
      self[col] = SecureRandom.urlsafe_base64
      break unless User.exists?(col => self[col])
    end
  end
end
