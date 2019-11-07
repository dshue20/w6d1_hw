class User < ApplicationRecord
    validates :username, :session_token, presence: true
    validates :password_digest, presence: { message: 'Password can\'t be blank'}
    validates :password, length: { minimum: 6, allow_nil: true }
    before_validation :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(username, password)
        User.find_by(username: username)
    end

    def self.generate_session_token
       SecureRandom::urlsafe_base64(16) 
    end

    def reset_session_token
        User.generate_session_token
    end

    def ensure_session_token
        self.session_token = User.generate_session_token if self.session_token.nil?
    end

    def password=(password)
        self.password_digest = BCrypt::Password.new(password)
    end
end
