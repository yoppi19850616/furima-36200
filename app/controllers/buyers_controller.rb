class BuyersController < ApplicationController
  def index
    @buyers = BuyersAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyers = BuyersAddress.new(buyer_params)
    @item = Item.find(params[:item_id])
    if @buyers.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buyer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
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
end
