class AddPackageRefToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :package, foreign_key: true
  end
end
