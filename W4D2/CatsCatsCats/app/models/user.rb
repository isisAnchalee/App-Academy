class User < ActiveRecord::Base
  before_validation(on: :create) { reset_session_token! }
  attr_reader :password
  
  validates :session_token, :user_name, :password_digest, presence: true 
  validates :password, length: { minimum: 6, allow_nil: true}
  has_many :cats
  has_many :requests
  
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
  
  def badger=(asdf)
    100.times{puts 'digs'}
  end
  
  def password_digest
     BCrypt::Password.new(read_attribute("password_digest")) #rails is MAGIC
  end
  
  def self.find_by_credentials(user_options = {})
    
    user = User.find_by(user_name: user_options[:user_name])
    if user && user.is_password?(user_options[:password])
      user
    end
  end
  
end
