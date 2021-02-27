class UserCommunitiesController < ApplicationController

  def create
    #コミュニティとユーザーを探す
    @community = Community.find(params[:community_id])
    @user_community = UserCommunity.new(community_id:@community.id, user_id:current_user.id)
     # 保存成功したら
     if @user_community.save
     # コミュニティの参加人数を更新
      add_people = @community.participation_people + 1
      @community.update(participation_people:add_people)
      redirect_to community_path(@community.id), notice: '参加しました'
     # 失敗したらエラーメッセージを返す
     else
     redirect_to community_path(@community.id), alert: '参加できませんでした'
   end
 end

end
