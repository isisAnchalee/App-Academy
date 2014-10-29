class User < ActiveRecord::Base
  after_initialize :reset_session_token!
  
  def reset_session_token!
    self.session_token = SecureRandom.base64
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
  
  def self.find_by_credentials(user_name, password)
    u = User.find_by(user_name: user_name)
    return if u.is_password?(password)
    u
  end
end
