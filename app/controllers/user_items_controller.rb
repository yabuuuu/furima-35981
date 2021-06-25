class UserItemsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new(user_item_params)
    if @user_item.valid?
      @user_item.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user_item_params
    params.require(:user_item)..merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
