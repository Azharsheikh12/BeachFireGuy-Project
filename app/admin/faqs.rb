ActiveAdmin.register Faq do
  menu parent: 'Content', label:'Set Faqs', priority: 1
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :question, :answer
  #
  # or
  #
  # permit_params do
  #   permitted = [:question, :answer]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :question
      f.input :answer
      f.actions
    end
  end


  index do
    selectable_column
    id_column
      column :question
      column :answer
    actions
  end

  show do
    attributes_table do
      row :question
      row :answer
    end
  end  
end
