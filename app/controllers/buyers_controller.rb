class BuyersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index_soldout, only: [:index]

  def index
    @buyers = BuyersAddress.new
  end

  def create
    @buyers = BuyersAddress.new(buyer_params)
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index_soldout
    redirect_to root_path unless @item.buyer.nil?
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
