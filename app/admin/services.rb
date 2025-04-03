ActiveAdmin.register Service do
    menu parent: 'Service & Packages', label:'Set Services', priority: 1
    permit_params :name
  
  end
  