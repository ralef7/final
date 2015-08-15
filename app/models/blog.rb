class Blog < ActiveRecord::Base


	belongs_to :user
	has_many :posts, dependent: :nullify 
	has_many :follows, dependent: :nullify
	has_many :users_following, :through => :follows, source: :user, dependent: :nullify

	validates :name, presence: true


end
