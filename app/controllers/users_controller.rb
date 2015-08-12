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
		@user= User.new
		@user.username = params["username"]
		@user.email  = params["email"]
		@user.birthdate = params["bdaytime"]
		@user.sex = params["sex"]
		@user.password = params["password"]
	    @user.password_confirmation = params["password_confirmation"]
		
		if  @user.save
			flash[:notice] = "Thanks for signing up!"
			redirect_to root_url
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find_by(:id => session["user_id"])
		@user.email = params[:email]
		@user.birthdate = params[:birthdate]
		@user.sex = params[:sex]
		@user.password = params[:password]

		if @user.password.present? && @user.password == params[:password_confirmation] 
			if @user.save
				flash[:notice] = "Account updated."
				redirect_to user_url(@user.id)
			else
				render 'edit'
			end
		else
			@user.errors.add(:password, "doesn't match")
			render 'edit'
		end
	end
end