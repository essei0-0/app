class Api::V1::CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      ActionCable.server.broadcast('comment_channel', content: comment.content)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :room_id)
    end
end
