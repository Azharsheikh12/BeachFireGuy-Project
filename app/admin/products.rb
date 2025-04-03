ActiveAdmin.register Product, as: 'Frequently Bought Together' do
  menu parent: 'Content', label:'Set Frequently Bought Together', priority: 4
  permit_params :item, :price, :quantity, :duration, :thumbnail

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :item
      f.input :price
      f.input :duration
      f.input :thumbnail, as: :file, multiple: false

      f.actions
    end
  end

  index do
    selectable_column
    id_column
      column :item
      column :price
      column :duration
      column :thumbnail do |object|
        object.thumbnail.attached? ? image_tag(object.thumbnail, size: "100x100") : 'No Image'
      end
    actions
  end

  show do
    attributes_table do
      row :item
      row :price
      row :duration
      row :thumbnail do |object|
        object.thumbnail.attached? ? image_tag(object.thumbnail, size: "100x100") : 'No Image'
      end
    end
  end
end