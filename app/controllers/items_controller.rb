class ItemsController < ApplicationController

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(new_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :shipping_charge_id, :area_id, :send_date_id, :price,).merge(user_id: current_user.id)
  end
end
