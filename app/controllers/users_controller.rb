class UsersController < ApplicationController

	  before_action :authorize_user, only: [:edit, :update, :edit_password, :update_password]

	def authorize_user
		@user = User.find_by(:id => params["id"])
		if @user.id != session[:user_id].to_i
			redirect_to root_url, notice: "Nice Try!"
		end
	end

	def index
		@users = User.limit(500)
	end

	def new
	end

	def edit
	end

	def destroy
		@user = User.find_by(:id => params["id"])
		@user.destroy
		reset_session	
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
			redirect_to blogs_url
		else
			render "new"
		end
	end

	def show
		@user = User.find(session[:user_id])
		@follow = Follow.where(:user_id => session[:user_id]).limit(500)
	end

	def edit_password
	end

	def update_password
		@user.password = params[:password]
		if @user.password.present? && @user.password == params[:password_confirmation]
			@user.save
			if @user.save
				flash[:notice] = "Password updated"
				redirect_to user_url(@user.id)
			else
				render 'edit_password'
			end
		else
			@user.errors.add(:password, "doesnt match")
			render 'edit_password'
		end
	end

	def update
		@user.email = params[:email]
		@user.birthdate = params[:birthdate]
		@user.sex = params[:sex]
		@user.save
		redirect_to user_url(@user.id)
	end
end