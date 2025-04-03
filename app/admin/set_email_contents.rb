ActiveAdmin.register SetEmailContent do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :content
  
  form do |f|
    f.inputs do
      f.input :title, as: :select, collection: ['Order request', 'Approve order']
      f.input :content, as: :quill_editor

      f.actions
    end
  end
  # or
  #
  # permit_params do
  #   permitted = [:title, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do
    before_action :check_existing_title, only: [:create]

    def check_existing_title
      title = params[:set_email_content][:title]
      if SetEmailContent.exists?(title: title)
        flash[:error] = "An email content with the title '#{title}' already exists."
        redirect_to new_admin_set_email_content_path
      end
    end
  end
  
end
