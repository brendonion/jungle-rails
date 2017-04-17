class User < ActiveRecord::Base
  
  has_secure_password
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length: { minimum: 6 }, on: :create

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: (email.strip).downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
