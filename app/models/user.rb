class User < ActiveRecord::Base
	
	has_secure_password

	has_many :blogs, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :follows, dependent: :destroy

	has_many :followed_blogs, :through => :follows, source: :blog, dependent: :destroy

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true

end