class MembersController < ApplicationController
  before_action :require_login
  def create
    group = Group.find(params[:id])
    unless current_user.members.where(group: group).first
      current_user.members.create(group: group)
      redirect_to "/groups/#{group.id}"
    else
      redirect_to "/groups"
    end
  end

  def destroy
    group = Group.find(params[:id])
    if current_user.members.where(group: group).first
      current_user.members.where(group: group).first.destroy
      redirect_to "/groups/#{group.id}"
    else
      redirect_to "/groups"
    end
  end
end
