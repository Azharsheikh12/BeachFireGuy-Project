class AddDetailstoServiceLocatioin < ActiveRecord::Migration[7.0]
  def change
    add_column :service_locations, :beach_details, :text
  end
end
