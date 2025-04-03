class CreateSetEmailContents < ActiveRecord::Migration[7.0]
  def change
    create_table :set_email_contents do |t|
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
