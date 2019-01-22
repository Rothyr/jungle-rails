class User < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 }
  before_save :downcase_fields

  def self.authenticate_with_credentials (email, password)
    user = User.find_by email: email.downcase.strip
    user.authenticate(password)
  end

  def downcase_fields 
    self.email = email.downcase.strip
  end

end
