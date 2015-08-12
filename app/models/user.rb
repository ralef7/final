class User < ActiveRecord::Base

	has_many :blogs
	has_many :comments
	has_many :follows

	has_many :followed_blogs, :through => :follows, source: :blog

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true


end