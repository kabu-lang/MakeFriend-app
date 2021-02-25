class CommunitiesController < ApplicationController

  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.date = DateTime.new(
      params[:community]["date(1i)"].to_i,
      params[:community]["date(2i)"].to_i,
      params[:community]["date(3i)"].to_i,
      params[:community]["date(4i)"].to_i,
      params[:community]["date(5i)"].to_i
    )
    if @community.save
      redirect_to @community
    else
      render 'new'
    end
  end


  def show
    @community = Community.find(params[:id])
  end

  def edit
  end

  def update
  end


  private

  def community_params
    params.require(:community).permit(:name, :prefecture_id, :municipality, :area_detail, :max_people, :category_id)
  end


end
