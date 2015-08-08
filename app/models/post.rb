class Post < ActiveRecord::Base

	belongs_to :blog
	has_many :comment

	validates :text, presence: :true

end