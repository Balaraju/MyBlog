class PostsController < ApplicationController
  
  def index
    @posts = Post.all
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
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    #raise @Post.comments.count.inspect
    @comments = @post.comments
  end
  
  def comment_form
    @comment = @Post.comments.new
    @post = Post.find(params[:id])
  end
  
  def comments
  #raise params.inspect
    @post = Post.find(params[:Post])
    #@user = current_user.employee
    @comment =  @post.comments.new(:comment => params[:comment])# :employee_id => @employee.id)     
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)    
    end   
  end
  
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
   
  def landing_page
    render :layout => false 
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content).merge!(user_id: current_user.id)
  end
end
