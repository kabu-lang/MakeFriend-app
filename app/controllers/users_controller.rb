class UsersController < ApplicationController
  before_action do
  puts current_user
  end
  
  def show
    @user = User.find(params[:id])
    current_user = @user
  end

end
