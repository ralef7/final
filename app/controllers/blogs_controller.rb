class BlogsController < ApplicationController

	def index
		@blogs = Blog.order("name asc")
	end

	def new
	end

	def edit
		@blog = Blog.find_by(:id => params["id"])
	end

	def destroy
		@blog = Blog.find_by(:id => params["id"])
		@blog.delete
		redirect_to :action => 'index'
	end

	def create
		blog= Blog.new
		blog.name = params["name"]
		blog.description = params["description"]
		blog.user_id = params["user_id"]
		blog.save
		redirect_to root_url
	end


	def show
		@blog = Blog.find_by(:id => params[:id])
	end

	def update
		@blog = Blog.find_by(:id => params["id"])
		@blog.name = params["name"]
		@blog.description = params["description"]
		@blog.save
		redirect_to :action => 'show', :id => params[:id]
	end

end