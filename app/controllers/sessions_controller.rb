class SessionsController < ApplicationController
  helper_method :current_user

  def new
    # Acts as a log in page
    @user = User.new
    render :new
  end

  def create
    # action of loging in
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      login!(@user)
      flash[:welcome] = "Welcome, #{@user.email}!"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["That email password combination was not found."]
      @user = User.new
      render :new
    end
  end

  def destroy
    # Log out
    user = self.current_user
    user.reset_session_token!
    session[:session_token] = nil
    redirect_to root_url
  end
end
