class User < ActiveRecord::Base

	has_many :blog
	has_many :comment
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true


end