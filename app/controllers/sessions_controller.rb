class SessionsController < ApplicationController

	def new
	end

	def destroy
		reset_session
		redirect_to root_url, notice: "Goobye!"
	end

	def create
		user = User.find_by_email(params["email"])

		if user
			if user.authenticate(params["password"]) 
				session[:user_id] = user.id
				flash[:notice] = "Hell again, #{user.username}"
				redirect_to root_url
			else
				render 'new'
			end
		else
			render 'new'
		end
	end
end

