class BlogsController < ApplicationController

	before_action :get_blog, only: [:show, :edit, :update, :destroy]
	before_action :authorize_user, only: [:edit, :update]

	def get_blog
		@blog = Blog.find_by(:id => params["id"])
	end

	def authorize_user
		if @blog.user_id != session[:user_id].to_i
			redirect_to root_url, notice: "Nice Try!"
		end
	end

	def index
		@blogs = Blog.order("name asc").limit(500)
	end

	def new
		@author = current_user
	end

	def edit
	end

	def destroy
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
		@posts = Post.where(:blog_id => @blog.id)
		@follow = Follow.exists?(:user_id => session[:user_id], :blog_id => @blog.id)
	end

	def update
		@blog.name = params["name"]
		@blog.description = params["description"]
		@blog.save
		redirect_to :action => 'show', :id => params[:id]
	end

end