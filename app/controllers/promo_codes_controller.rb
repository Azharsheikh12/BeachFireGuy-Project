class PromoCodesController < ApplicationController

    def apply_coupen
        @cart = Cart.find(params[:cart])
        @coupen = PromoCode.find_by(code: params[:coupen])
        if @coupen && @coupen.quantity >= 1
            package_price = @cart.price
            total_product_price = @cart.items.sum(:price)
            total = package_price + total_product_price
            @discounted_price = calculate_discounted_price(total, @coupen.discount_percentage)
            @cart.update(total: @discounted_price)
            @coupen.update(quantity: @coupen.quantity - 1)
        else
            render :json, status: :unprocessable_entity
        end
        respond_to do |format|
            format.js
        end
    end

private
    def calculate_discounted_price(original_price, discount_percentage)
        discounted_amount = original_price * (discount_percentage / 100)
        (original_price - discounted_amount).round(2)
     end
end
