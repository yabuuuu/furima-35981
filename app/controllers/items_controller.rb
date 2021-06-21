class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: :new

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  

  private
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:condition_id,:shipping_burden_id,:shipping_area_id,:shipping_date_id,:price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? 
      redirect_to new_user_session_path
    end
  end

end
