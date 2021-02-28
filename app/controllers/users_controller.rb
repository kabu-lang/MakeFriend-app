class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    if params[:send_category] == nil && params[:send_prefecture] == nil
      @users = User.except_current_user(current_user.id)
    elsif !params[:send_category].nil?
      @users = User.includes(:categories).where(categories:{id:params[:category_id][:id]}).except_current_user(current_user.id)
    else
      @users = User.where(prefecture_id:params[:prefecture_id][:id]).except_current_user(current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @user_communities = @user.communities
  end

end
