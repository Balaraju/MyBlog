class CommentsController < ApplicationController
  def index
  end
  
  def create
   @post= Post.find(params[:post_id])
   @post.comments.create(comment: params[:comment][:comment], user_id: current_user.id)
   redirect_to @post
  end 
end
