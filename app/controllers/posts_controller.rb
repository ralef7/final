class PostsController <ApplicationController

	 before_action :get_post, only: [:show, :edit, :update, :delete]
	 before_action :authorize_user, only: [:edit, :update]

	def get_post
		@post = Post.find_by(:id => params["id"])
	end

	def authorize_user
		if @post.blog.user_id != session[:user_id].to_i
			redirect_to root_url, notice: "Nice Try!"
		end
	end

	def index
	end

	def new
		# needed different check here than in authorize_user.
		@blog = Blog.find_by(:id => params[:blog])
		if @blog.user_id != session[:user_id].to_i
			redirect_to root_url, notice: "Nice Try!"
		end
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
		#Do not want current_user here.  Nil id's should be aloud to view (and only view) conent.
		@user = User.find_by(:id => session[:user_id])
		@post = Post.find(params["id"])
		@posts = Post.where(blog_id: @post.blog_id).limit(500)
		@comments = Comment.where(post_id: @post.id).limit(500)
	end

	def delete
		@post.destroy
		redirect_to :back
	end

	def edit
		@blogs = Blog.where(:user_id => session[:user_id]).limit(500)
	end

	def update
		@post.title = params["title"]
		@post.text = params["text"]
		@post.blog_id = params["blog_id"]
		@post.save
		redirect_to :action => 'show', :id => params[:id]
	end
end