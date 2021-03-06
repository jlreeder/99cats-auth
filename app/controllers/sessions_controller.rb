class SessionsController < ApplicationController
  before_action :redirect_to_cats, except: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:user_name],
      session_params[:password]
    )

    if @user
      @user.reset_session_token!
      login(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to cats_url
    end
  end

  private

  def session_params
    params.require(:session).permit(:user_name, :password)
  end

  def redirect_to_cats
    redirect_to cats_url if current_user
  end
end
