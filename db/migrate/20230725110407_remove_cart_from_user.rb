class RemoveCartFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :cart, null: false, foreign_key: true
  end
end
