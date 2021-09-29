class BuyersController < ApplicationController
  def index
    @buyers = BuyersAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyers = BuyersAddress.new(buyer_params)
    @item = Item.find(params[:item_id])
    if @buyers.valid?
      pay_item
       @buyers.save
       redirect_to root_path
    else
       render :index
    end
  end

private
  def buyer_params
    params.require(:buyers_address).permit(:postal_code, :area_id, :municipalities, 
                                  :number_address, :building_name, :phone_number, :area_id)
                                  .merge(user_id: current_user.id, item_id: params[:item_id],
                                   token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price, 
        card: buyer_params[:token],  
        currency: 'jpy' 
      )
  end

end
