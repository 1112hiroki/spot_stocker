class CommentsController < ApplicationController
	before_action :set_spot, only: %i[create update destroy]
	before_action :set_comment, only: %i[update destroy]

	def create
		@comment = @spot.comments.build(comment_params)
		@comment.user = current_user
		render :error unless @comment.save
	end

	def update
		unless @comment.update(comment_params)
      render :error
    end
	end
	
	def destroy
		render :error unless @comment.destroy
	end

	private

	def set_spot
		@spot = Spot.find(params[:spot_id])
	end

	def set_comment
		@comment = @spot.comments.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:content)
	end
end