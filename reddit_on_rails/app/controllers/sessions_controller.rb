class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to posts_url #check the route to redirect to
    else
      flash[:errors] = ['invalid credentials']
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
