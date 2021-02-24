class CommunitiesController < ApplicationController

  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    
    @community = Community.create(community_params)

    if @community.save
      redirect_to @community, notice:"コミュニティを作成しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end

  private

  def community_params
　   params.require(:community).permit(:name, :prefecture_id, :municipality, :area_detail, :max_people, :date, :category)
  end
