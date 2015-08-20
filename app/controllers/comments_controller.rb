class CommentsController <ApplicationController

	 before_action :authorize_user, only: [:edit, :update]

	def authorize_user
		@comment = Comment.find_by(:id => params["id"])
		if @comment.user_id != session[:user_id].to_i
			redirect_to root_url, notice: "Nice Try!"
		end
	end


	def new
	end

	def create
		comment= Comment.new
		comment.title = params["title"]
		comment.text = params["text"]
	    comment.user_id = session["user_id"]
	    comment.post_id = params["post_id"]
		comment.save
		redirect_to "/posts/#{comment.post_id}"
	end

	def edit
	end

	def update
		@comment.title = params["title"]
		@comment.text = params["text"]
	    @comment.user_id = session["user_id"]
	    @comment.post_id = params["post_id"]
		@comment.save
		redirect_to "/posts/#{@comment.post_id}"
	end

	def delete
		@comment = Comment.find_by(:id => params["id"])
		@comment.destroy
		redirect_to "/posts/#{@comment.post_id}"
	end

	def show
		@comment = Comment.find(params["id"])
	end

end