class Blog < ActiveRecord::Base


	belongs_to :user
	has_many :posts
	has_many :follows

	has_many :users, :through => :follows

	validates :name, presence: true


end
