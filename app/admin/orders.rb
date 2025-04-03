require "google/apis/calendar_v3"
require "google/api_client/client_secrets.rb"
require_relative '../services/google_calendar_service'


ActiveAdmin.register Order do
  menu parent: 'Orders', label:'Your Orders', priority: 1
  permit_params :total_amount, :payment_mode, :payment_status
  member_action :approve, method: :put do
    order = Order.find(params[:id])
    order.update(approved: true)
    # add_to_google_calendar(order)
    @users = order.cart.user
    UserMailer.with(user: @users).order_successfull_email.deliver_later(wait: 1.minute)
    calendar_service = GoogleCalendarService.new
    summary = "Order id #{order.id} Approved"
    date = order.setup_time.strftime("%Y-%m-%d")
    time = order.setup_time_slot.split[0]
    start_time =  Time.zone.parse(date +' '+ time).to_datetime
    end_time = start_time + 30.minutes
    description = 'Order approval details'
    location = order.cart.service_location.location_name
    
    calendar_service.create_event(summary, start_time, end_time, description, location)

    # UserMailer.with(user: @users).notification_email.deliver_now
    # GoogleEventJob.set(wait: 1.minute).perform_later(order)
    # OrderMailer.with(order: order).order_approved_email.deliver_now
    redirect_to admin_orders_path, notice: "Order approved successfully!"
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :total_amount, readonly: true
      f.input :payment_mode, readonly: true
      f.input :payment_status, readonly: true

      f.actions
    end
  end

  index do
    selectable_column
    id_column
    column :total_amount
    column :payment_mode
    column :payment_status
    column :created_at, label: "Order Date&Time"
    column :approved
    column "Actions" do |order|
      link_to "Approve Order", approve_admin_order_path(order), method: :put, data: { confirm: "Are you sure you want to approve this order?\nApproving may result in sending an email to the related user." }
    end
    actions
end


  show do |order|
    panel "Chosen Package" do
      attributes_table_for order.cart do
        row :product
        row :price
        row :quantity
        row :total
      end
    end

    if order.cart.service_location.present?
      panel "Location" do
        table_for order.cart.service_location do
          column :location_name
          column :location_details
        end
      end
    end

    if order.present?
      panel "Setup Time" do
        table_for order do
          column :setup_time
          column :setup_time_slot
        end
      end
    end

    if order.cart.items.present?
      panel "Additional Items" do
        table_for order.cart.items do
          column :name
          column :price
          column :quantity
        end
      end
    end
    if order.cart.user.present?
      panel "User Details" do
        attributes_table_for order.cart.user do
          row :first_name
          row :last_name
          row :phone
          row :country_code
          row :street_address
          row :closest_street_address
          row :company_name
          row :city
          row :state
          row :zip_code
          row :additional_notes
          row :email
          row :total_guests
          row :active
          row :coupon_code
        end
      end
    end

    attributes_table do
        row :payment_mode
        row :approved
        row :payment_status
        row 'Total Amount' do
          strong(number_to_currency(order.total_amount))
        end
      end
    end

  controller do
    
    def new
      redirect_to admin_orders_path, alert: "Admin can't create new orders."
    end

    def create
      redirect_to admin_orders_path, alert: "Admin can't create new orders."
    end
  end
end
