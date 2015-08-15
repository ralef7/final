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
		@user = User.find_by(:id => session[:user_id])
		@post = Post.find(params["id"])
	end

	def delete
		@post = Post.find_by(:id => params["id"])
		@post.delete
		redirect_to :back
	end

	def edit
		@post = Post.find_by(:id => params["id"])
	end

	def update
		@post = Post.find_by(:id => params["id"])
		@post.title = params["title"]
		@post.text = params["text"]
		@post.blog_id = params["blog_id"]
		@post.save
		redirect_to :action => 'show', :id => params[:id]
	end
end