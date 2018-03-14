class PostsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :require_correct_user

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)

    @post.user_id = current_user.id

    if @post.save
      redirect_to post_url(@post.id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post.id)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:url, :title, :content, :sub_id = [])
  end

  def require_correct_user
    return if current_user.posts.find_by(id: params[:id])
    render json: 'Invalid Access Page'
  end
end
