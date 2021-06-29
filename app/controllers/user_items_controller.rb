class UserItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @user_item_delivery =  UserItemDelivery.new
  end

  def create
    @user_item_delivery = UserItemDelivery.new(user_item_params)
    if @user_item_delivery.valid?
      pay_item
      @user_item_delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_item_params
    params.require(:user_item_delivery). permit(:zip_code, :shipping_area_id, :municipalities, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: user_item_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if (current_user.id == @item.user_id) || @item.user_item
  end

end
