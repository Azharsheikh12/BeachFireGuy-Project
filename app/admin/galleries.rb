ActiveAdmin.register Gallery do
  menu parent: 'Content', label:'Set Gallery', priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :picture_name, :thumbnail
  #
  # or
  #
  # permit_params do
  #   permitted = [:picture_name, :thumbnail]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form html: { multipart: true } do |f|
    f.inputs do
      f.input :picture_name
      f.input :thumbnail, as: :file, multiple: false
      f.actions
    end
  end


  index do
    selectable_column
    id_column
      column :picture_name
      column :thumbnail do |object|
        object.thumbnail.attached? ? image_tag(object.thumbnail, size: "100x100") : 'No Image'
      end
    actions
  end

  show do
    attributes_table do
      row :picture_name
      row :thumbnail do |object|
        object.thumbnail.attached? ? image_tag(object.thumbnail, size: "100x100") : 'No Image'
      end
    end
  end

end
