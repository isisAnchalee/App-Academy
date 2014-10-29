class User < ActiveRecord::Base
  before_validation(on: :create) { reset_session_token! }
  
  validates :session_token, presence: true 
  
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    password_digest.is_password?(password)
  end
  
  def password_digest
     BCrypt::Password.new(attributes["password_digest"]) #rails is MAGIC
  end
  
  def self.find_by_credentials(options = {})
    u = User.find_by(user_name: options[:user_name])
    if u.nil?
      nil
    elsif u.is_password?(options[:password])
      return u
    else
      nil
    end
  end
end
