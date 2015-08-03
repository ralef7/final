class User < ActiveRecord::Base

	has_many :blog
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

end