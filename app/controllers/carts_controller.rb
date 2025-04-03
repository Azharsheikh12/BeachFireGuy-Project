class CartsController < ApplicationController
  respond_to :html, :js
 
  def index
  end

  def show
    @cart = Cart.find(params[:id])
    @product = Product.new
    @products = Product.all
  end

  def new
    @packages = Package.find(params[:package])
    @service_location = ServiceLocation.find(params[:service_location])
    @cart = Cart.create(product:@packages.package_name, price: @packages.package_price, quantity:1,subtotal: @packages.package_price,total:@packages.package_price,package_id: @packages.id,service_location_id:@service_location.id)
    if @packages.service.id == 1
     @product_addons = ProductAddon.where(service_id:1)
    else
     @product_addons = ProductAddon.where(service_id:2)
    end
  end

  def add_to_cart
    @cart = Cart.find(params[:cart_id])
    @cart.add_item(params[:product_addons_id],params[:product_type])
    respond_to do |format|
    format.js 
  end
  end

  def remove_to_cart
    @cart = Cart.find(params[:cart_id])
    @cart.remove_one_item(params[:product_addons_id],params[:product_type]) 
    respond_to do |format|
      format.js 
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
     @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to cart_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete_item
    @cart = Cart.find(params[:cart_id])
    if params[:product_type] == "product_addons"
       @cart.items.where(product_addon_id: params[:product_addons_id]).first.destroy
    else
      @cart.items.where(product_id: params[:product_addons_id]).first.destroy
    end
      respond_to do |format|
      format.js 
      end
  end

  private

  def cart_params
    params.require(:cart).permit(:product, :price, :quantity, :subtotal, :total, :coupon, :user_id)
  end
end
