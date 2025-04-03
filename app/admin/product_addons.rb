ActiveAdmin.register ProductAddon do
   menu parent: 'Content', label:'Set Product Addons', priority: 5
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :item, :price, :quantity, :duration, :thumbnail, :service_id
  #
  # or
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :service
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
      column :service
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
      row :service
      row :item
      row :price
      row :duration
      row :thumbnail do |object|
        object.thumbnail.attached? ? image_tag(object.thumbnail, size: "100x100") : 'No Image'
      end
    end
  end
  
end
