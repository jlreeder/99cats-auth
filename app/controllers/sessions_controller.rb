class SessionsController < ApplicationController
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
      session[:session_token] = @user.session_token
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:user_name, :password)
  end
end
