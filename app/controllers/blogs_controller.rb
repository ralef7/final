class BlogsController < ApplicationController

	  before_action :authorize_user, only: [:edit, :update]

	def authorize_user
		@blog = Blog.find_by(:id => params["id"])
		if @blog.user_id != session[:user_id].to_i
			redirect_to root_url, notice: "Nice Try!"
		end
	end

	def index
		@blogs = Blog.order("name asc").limit(500)
	end

	def new
		@author = User.find(session[:user_id])
	end

	def edit
		@blog = Blog.find_by(:id => params["id"])
	end

	def destroy
		@blog = Blog.find_by(:id => params["id"])
		@blog.destroy
		redirect_to :action => 'index'
	end

	def create
		blog= Blog.new
		blog.name = params["name"]
		blog.description = params["description"]
		blog.user_id = session["user_id"]
		blog.save
		redirect_to :action => 'index'
	end

	def show
		@blog = Blog.find_by(:id => params[:id])
		@post = Post.where(:blog_id => @blog.id)
		@follow = Follow.exists?(:user_id => session[:user_id], :blog_id => @blog.id)
	end

	def update
		@blog = Blog.find_by(:id => params["id"])
		@blog.name = params["name"]
		@blog.description = params["description"]
		@blog.save
		redirect_to :action => 'show', :id => params[:id]
	end

end