ActiveAdmin.register Package do
  menu parent: 'Service & Packages', label:'Set Package', priority: 1
  
  permit_params :package_name, :package_price, :description, :extra_details, :thumbnail, :service_id

    form html: { multipart: true } do |f|
    f.inputs do
      f.input :service
      # f.input :service_location_id , :as => :select, :collection => ServiceLocation.all.collect {|location| [location.location_name,location.id ]}
      f.input :package_name
      f.input :package_price
      f.input :description
      f.input :extra_details
      f.input :thumbnail, as: :file, multiple: false

      f.actions
    end
  end

  index do
    selectable_column
    id_column
      column "Service" do |service| 
        Service.find(service&.service_id)&.name
      end
      column :package_name
      column :package_price
      column :description
      column :extra_details
      column :thumbnail do |object|
        object.thumbnail.attached? ? image_tag(object.thumbnail, size: "100x100") : 'No Image'
      end
    actions
  end

  show do
    attributes_table do
      row :package_name
      row :package_price
      row :description
      row :extra_details
      row :thumbnail do |object|
        object.thumbnail.attached? ? image_tag(object.thumbnail, size: "100x100") : 'No Image'
      end
    end
  end
  
end