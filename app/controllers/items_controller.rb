class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]
  before_action :move_to_index_soldout, only: [:edit]
  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :shipping_charge_id, :area_id, :send_date_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_to_index_soldout
    redirect_to action: :index unless @item.buyer.nil?
  end
end
