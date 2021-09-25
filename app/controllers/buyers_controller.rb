class BuyersController < ApplicationController
  def index
    @buyers = Buyer.new
  end

  def new
  end
end
