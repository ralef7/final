class User < ActiveRecord::Base
	# attr_accessor :rememeber_token, :activation_token, :reset_token
	has_secure_password

	has_many :blogs, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :follows, dependent: :destroy

	has_many :followed_blogs, :through => :follows, source: :blog, dependent: :destroy

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true

	# def authenticated?(attribute, token)
	# 	digest = send("#{attribute}_digest")
	# 	return false if digest.nil?
	# 	BCrypt::Password.new(digest).is_password?(token)
	# end

	# def send_password_reset_email
	# 	UserMailer.password_reset(self).deliver_now
	# end

	# def password_rest_expired?
	# 	reset_sent_at < 2.hours.ago
	# end

	# def create_reset_digest
	# 	self.reset_token = User.new_token
	# 	update_attribute(:reset_digest, User.digest(reset_token))
	# 	update_attribute(:reset_sent_at, Time.zone.now)	
	# end

	# def downcase_email
	# 	self.email = email.downcase
	# end

	# def User.new_token
	# 	SecureRandom.urlsafe_base64
	# end

	# def User.digest(string)
	# 	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST:
	# 												  BCrypt::Engine.cost
	# 	BCrypt::Password.create(string, cost: cost)
	# end



end