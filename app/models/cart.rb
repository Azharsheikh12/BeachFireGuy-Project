class Cart < ApplicationRecord
	self.table_name = :carts
	has_many :items
	has_many :orders
  belongs_to :package
  belongs_to :service_location
	belongs_to :user, optional: true

	def add_item(product_addons_id,product_type)
    if product_type == "product_addons" 
      product = ProductAddon.find(product_addons_id)
      item = items.where('product_addon_id = ?', product_addons_id).first
      if item
        item.update(quantity: item.quantity + 1)
        item.update(price: product.price * item.quantity)
      else
        items << Item.new(product_addon_id: product_addons_id, quantity: 1, name: product.item, price: product.price)
      end
      save
    elsif product_type == "product_list" 
      product = Product.find(product_addons_id)
      item = items.where('product_id = ?', product_addons_id).first
      if item
        item.update(quantity: item.quantity + 1)
        item.update(price: product.price * item.quantity)
      else
        items << Item.new(product_id: product_addons_id, quantity: 1, name: product.item, price: product.price)
      end
      save
    end
  end

  def remove_one_item(product_id,product_type)
    if product_type == "product_addons" 
      product = ProductAddon.find(product_id)
      item = items.where('product_addon_id = ?', product_id).first
      if item.quantity > 1
        item.update(quantity: item.quantity - 1)
        item.update(price: product.price * item.quantity)
      else
        item.destroy
      end
    elsif product_type == "product_list"
      product = Product.find(product_id)
      item = items.where('product_id = ?', product_id).first
      if item.quantity > 1
        item.update(quantity: item.quantity - 1)
        item.update(price: product.price * item.quantity)
      else
        item.destroy
      end
    end
  end

end
