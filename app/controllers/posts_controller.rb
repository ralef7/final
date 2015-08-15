class PostsController <ApplicationController

	# model after actors to movies. each single movie has a bunch of actors...

	def index
	end

	def new
	end

	def create
		@post= Post.new
		@post.title = params["title"]
		@post.text = params["text"]
		@post.blog_id = params["blog_id"]
		@post.save
		redirect_to "/blogs/#{@post.blog_id}"
	end

	def show
		@post = Post.find(params["id"])
	end

	def delete
		@post = Follow.find_by(:id => params["id"])
		@post.delete
		redirect_to :back
	end

	def edit
	end

	def update
	end
end