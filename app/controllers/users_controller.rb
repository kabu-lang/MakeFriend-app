class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    if params[:send_category] == nil && params[:send_area] == nil
      @users = User.all
    elsif !params[:send_category].nil?
      @users = User.includes(:categories).where(categories:{id:params[:category_id][:id]} )
    else
      @users = User.where(area:params[:user][:area])
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
