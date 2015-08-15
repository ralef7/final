class User < ActiveRecord::Base

	has_secure_password

	has_many :blogs, dependent: :nullify
	has_many :comments, dependent: :nullify
	has_many :follows, dependent: :nullify

	has_many :followed_blogs, :through => :follows, source: :blog, dependent: :nullify

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true


end