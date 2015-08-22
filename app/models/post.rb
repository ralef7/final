class Post < ActiveRecord::Base

	belongs_to :blog
	has_many :comment, dependent: :nullify

	validates :text, presence: :true
end