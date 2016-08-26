class GroupsController < ApplicationController
  before_action :set_user
  before_action :require_login

  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    group = Group.new(get_group_info)
    if group.valid?
      group.save
      group.members.create(user: @user)
      redirect_to :back, notice: "You have successfully created a group!"
    else
      redirect_to :back , alert: group.errors.full_messages
    end
  end

  def destroy
    group = Group.find(params[:id])
    if group.user == @user
      deleted = group.destroy
      if deleted
        redirect_to :back, notice: "You have successfully deleted a group!"
      else
        redirect_to :back, alert: "Something went wrong while deleting, please try again!"
      end
    else 
      redirect_to :back, alert: "You not allowed to do that!"
    end
  end
  
  private
  def set_user
    @user = current_user
  end
  def get_group_info
    params.require(:group).permit(:name, :description).merge(user: current_user)
  end
end
