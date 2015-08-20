class Blog < ActiveRecord::Base


	belongs_to :user
	has_many :posts, dependent: :nullify 
	has_many :follows, dependent: :destroy
	has_many :users_following, :through => :follows, source: :user, dependent: :destroy

	validates :name, presence: true


end
