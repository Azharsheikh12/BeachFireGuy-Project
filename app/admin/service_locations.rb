ActiveAdmin.register ServiceLocation do
  menu parent: 'Locations', label:'Set Locations', priority: 1
  permit_params :location_name, :location_details, :beach_details, thumbnails: []

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :location_name
      f.input :location_details
      f.input :beach_details , as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link']] }, placeholder: 'Type something...', theme: 'snow' } } }
      f.input :thumbnails, as: :file, input_html: { multiple: true }

      f.actions
    end
  end

index do
  selectable_column
  id_column
  column :location_name
  column :location_details
  column :latitude
  column :longitude
  column :beach_details
  column :thumbnails do |service_location|
    if service_location.thumbnails.attached?
      service_location.thumbnails.each do |thumbnail|
        span do
          image_tag(thumbnail, size: "100x100")
        end
      end
    else
      'No Images'
    end
  end
  actions
end

show do
  attributes_table do
    row :location_name
    row :location_details
    row :latitude
    row :longitude
    row :beach_details
    row :thumbnails do |service_location|
      if service_location.thumbnails.attached?
        service_location.thumbnails.each do |thumbnail|
          span do
            image_tag(thumbnail, size: "100x100")
          end
        end
      else
        'No Images'
      end
    end
  end
end

  controller do
    def create
      @location = ServiceLocation.new(location_params)
      if @location.geocode && @location.save
        redirect_to admin_service_location_path(@location)
      else
        flash[:alert] = "Invalid location choose location only pinned by google maps."
        redirect_to new_admin_service_location_path(@location)
      end
    end

    private

    def location_params
      params.require(:service_location).permit(:location_name, :location_details, :beach_details, thumbnails: [])
    end
  end
end
