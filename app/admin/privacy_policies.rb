ActiveAdmin.register PrivacyPolicy do
  menu parent: 'Privacy Terms', label: 'Set Privacy Policy', priority: 1

  actions :all, except: :new

  permit_params :title, :description

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline'], ['link']] }, placeholder: 'Type something...', theme: 'snow' } } }

      f.actions
    end
  end

  controller do
    def new
      if PrivacyPolicy.last.present?
        flash[:error] = "Privacy Policy already exists can't create more than one. Instead You can edit the existing one."
        redirect_to admin_privacy_policy_path(PrivacyPolicy.last)
      else
        super
      end
    end
  end
end
