class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.all
    @users = User.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
    
    unless @post.user == current_user
      render :text => "You don't have permission"
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end
  

  
  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :text => "You don't have permission"
    else
      @post.destroy
      redirect_to posts_path
    end
  end
   

  private
  
  def post_params
    params.require(:post).permit(:title, :content).merge!(user_id: current_user.id)
  end
end
