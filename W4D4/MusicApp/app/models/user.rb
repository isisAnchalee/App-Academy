class User < ActiveRecord::Base

	after_initialize :ensure_session_token
	attr_reader :password
	validates :email, presence: true, uniqueness: true
	validates :session_token, presence: true, uniqueness: true
	validates(
	    :password,
	    length: { minimum: 6, allow_nil: true }
	  )

	def ensure_session_token
		 self.session_token ||= SecureRandom.urlsafe_base64(16)
	end

	def self.generate_session_token
		 self.session_token = SecureRandom.urlsafe_base64(16)
		 self.save!
	end

	def reset_session_token!
		self.session_token = SecureRandom.urlsafe_base64(16)
		self.save!
		self.session_token #return the session token
	end

	def password=(password)
    return if !password.present?

    @password = password
    self.password_digest = BCrypt::Password.create(password)
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def self.find_by_credentials(email, password)
		@user = User.find_by(email: email)
		@user && @user.is_password?(password) ? @user : nil
	end

end


