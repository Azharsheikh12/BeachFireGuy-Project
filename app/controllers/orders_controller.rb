class OrdersController < ApplicationController
  def index
  end
  def show
    @orders = Order.last

  end
end
