class SubsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :require_correct_user, only: [:edit, :update]

  def new
    @sub = Sub.new
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = current_user.subs.new(sub_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def update
    @sub = current_user.subs.find(params[:id])

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  # def destroy
  #   @sub = Sub.find(params[:id])
  #   @sub.destroy!
    # redirect_to - where to redirect to?
  # end

  private

  def sub_params
    params.require(:subs).permit(:name, :description)
  end

  def require_correct_user
    return if current_user.posts.find_by(id: params[:id])
    render json: 'Invalid Access Page'
  end
end
