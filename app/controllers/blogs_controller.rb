class BlogsController < ApplicationController

	def index
		@blogs = Blog.order("name asc")
	end

	def show
		@blog = Blog.find_by(:id => params["id"])
	end

end