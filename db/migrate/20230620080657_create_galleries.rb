class CreateGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :picture_name
      t.string :thumbnail

      t.timestamps
    end
  end
end
