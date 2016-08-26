class SessionsController < ApplicationController
  # root
  def index
    if current_user
      redirect_to "/groups"
    else
      redirect_to '/main'
    end
  end

  def new
    # render 'new'
  end

  # login
  def create
    user = User.find_by(email: get_login_info[:email])
    if user && user.authenticate(get_login_info[:password])
      session[:user_id] = user.id
      redirect_to "/groups", notice: "You have successfully logged in!"
    else
      redirect_to :back, alert: ["Invalid email or password"]
    end
  end
  
  # logout
  def destroy
    session.delete(:user_id)
    redirect_to "/main", notice: "You have successfully logged out!"
  end

  private
  def get_login_info
    params.require(:user).permit(:email, :password)
  end
  
end
