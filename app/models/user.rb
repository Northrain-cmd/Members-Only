class User < ApplicationRecord
  before_create do
    generate_token(:auth_token)
  end
  has_secure_password
  validates :email, :username, presence: true

  def send_password_reset
    generate_token(:reset_password_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  private

  def generate_token(col)
    loop do
      self[col] = SecureRandom.urlsafe_base64
      break unless User.exists?(col => self[col])
    end
  end
end
