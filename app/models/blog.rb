class Blog < ActiveRecord::Base


	belongs_to :user
	has_many :post

	validates :name, presence: true


end
