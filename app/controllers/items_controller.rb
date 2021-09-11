class ItemsController < ApplicationController

  def new
    @item = Item.new
    if user_signed_in?
    else
      redirect_to user_session_path
    end
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
    params.require(:item).permit(:title, :description, :category_id, :status_id, :shipping_charge_id, :area_id, :send_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
