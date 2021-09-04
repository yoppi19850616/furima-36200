class ItemsController < ApplicationController
  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :shipping_charge_id, :area_id, :send_date_id, :price,).merge(user_id: current_user.id)
  end
end
