class PostsController < ApplicationController
  before_action :logged_in?
  before_action :require_author, only: [:edit, :update]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find_by(params[:id])
    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to sub_url(post)
  end

  def require_author

  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
