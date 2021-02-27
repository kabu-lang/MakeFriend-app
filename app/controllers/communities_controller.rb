class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update]


  def index
    if !params[:send_category].nil? && params[:category_id][:id] != ""
      @communities = Community.includes(:category).where(categories:{id:params[:category_id][:id]})
    elsif !params[:send_prefecture].nil? && params[:prefecture_id][:id] != ""
      @communities = Community.where(prefecture_id:params[:prefecture_id][:id])
    else
      @communities = Community.all
    end
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)

    @community.participation_people = 1
    @community.date = DateTime.new(
      params[:community]["date(1i)"].to_i,
      params[:community]["date(2i)"].to_i,
      params[:community]["date(3i)"].to_i,
      params[:community]["date(4i)"].to_i,
      params[:community]["date(5i)"].to_i
    )

    if @community.save
      @community.users << current_user
      redirect_to @community
    else
      render 'new'
    end
  end


  def show
  end

  def edit
  end

  def update
    if @community.update(community_params)
      @community.date = DateTime.new(
        params[:community]["date(1i)"].to_i,
        params[:community]["date(2i)"].to_i,
        params[:community]["date(3i)"].to_i,
        params[:community]["date(4i)"].to_i,
        params[:community]["date(5i)"].to_i
      )
      redirect_to @community
    else
      render 'edit'
    end
  end


  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name, :prefecture_id, :municipality, :area_detail, :max_people, :category_id, :author)
  end


end
