ActiveAdmin.register PromoCode do
  menu parent: 'Content', label:'Set Promo Code', priority: 4

  permit_params :code, :discount_percentage, :quantity

  index do
    selectable_column
    id_column
    column :code
    column :discount_percentage
    column :quantity
    actions
  end

  filter :code
  filter :discount_percentage

  form do |f|
    f.inputs do
      f.input :code
      f.input :discount_percentage
      f.input :quantity
    end
    f.actions
  end

  show do
    attributes_table do
      row :code
      row :discount_percentage
      row :quantity
    end
  end
  
end
