class UsersController < ApplicationController

  def create
    user = User.new(get_user_info)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to "/groups", notice: "You have successfully registered!"
    else
      redirect_to :back , alert: user.errors.full_messages
    end
  end
  private
  # def set_user
  #   @user = User.find(params[:id])
  #   # @user = current_user
  # end
  def get_user_info
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
