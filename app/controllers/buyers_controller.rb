class BuyersController < ApplicationController
  def index
    @buyers = Buyer.new
    @item = Item.find(params[:item_id])
  end

  def new
  end
end
