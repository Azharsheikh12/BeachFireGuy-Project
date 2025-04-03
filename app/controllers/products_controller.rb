class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def delete
  end

  def edit
    @cart = Cart.find(params[:id])
    @products = Product.find(params[:id])
  end

  def update
  end

  private
    def product_params
        params.require(:product).permit(:item, :price, :quantity, :duration, :thumbnail, :cart_id, :user_id)
    end
end
