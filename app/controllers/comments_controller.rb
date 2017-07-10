class CommentsController < ApplicationController

	before_action :set_pin
	
	def create  
	 	@comment = @pin.comments.build(comment_params)
	 	@comment.user_id = current_user.id

		if @comment.save
	 	redirect_to root_path
	 	else
			render root_path
 		end
	end


	def destroy
		@comment = @pin.comments.find(params[:id])

  		@comment.destroy
		flash[:success] = "Comment deleted :("
		redirect_to root_path
	end

	private

	def comment_params  
	  params.require(:comment).permit(:content)
	end

	def set_pin  
	  @pin = Pin.find(params[:pin_id])
	end  
end