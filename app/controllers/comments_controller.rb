class CommentsController <ApplicationController


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
	end

	def delete
		@comment = Comment.find_by(:id => params["id"])
		@comment.delete
		redirect_to "/posts/#{@comment.post_id}"
	end

	def show
		@comment = Comment.find(params["id"])
	end


end