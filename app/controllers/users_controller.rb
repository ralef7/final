class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
	end

	def edit
		@user = User.find_by(:id => params["id"])
	end

	def destroy
		@user = User.find_by(:id => params["id"])
		@user.delete
		redirect_to root_url
	end

	def create
		user= User.new
		user.username = params["username"]
		user.email  = params["email"]
		user.birthdate = params["bdaytime"]
		user.sex = params["sex"]
		user.password = params["password"]
		user.save
		redirect_to root_url
	end

	def show
		@user = User.find_by(:id => params["id"])
	end

	def update
		@user = User.find_by(:id => params["id"])
		@user.email = params[:email]
		@user.birthdate = params[:birthdate]
		@user.sex = params[:sex]
		@user.password = params[:password]
		@user.save
		redirect_to :action => 'show', :id => params[:id]
	end

end