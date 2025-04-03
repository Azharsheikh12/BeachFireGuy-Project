class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  
  def new    
    @users = User.new
    @cart = Cart.last
    @product_total = @cart.items.pluck(:price).sum
    @total =  @product_total + @cart.subtotal
    @cart.update(total: @total)
    @products = Product.all
  end

  def create
   @products = Product.all
   @user = User.find_by(email:user_params[:email])
   @cart = Cart.find(params[:user][:cart_id].to_i)
   @users = @user ? @user : User.new(user_params)
   if @user
      if params[:user][:active].present? &&  params[:user][:active] == "1"
        if params[:user][:password].present?
          @users.update(password: params[:user][:password] )
        else
          flash[:error] = 'Please enter password before continuing'
          @users.active = false
          return render :new, status: :unprocessable_entity
        end
      end
    @users.update(user_params)
    @cart.update(user_id:@users.id)
    @order = Order.create(total_amount:@cart.total, payment_mode:"Cash on Delivery",payment_status:"Not Done",cart_id:@cart.id, setup_time: $setup_time, setup_time_slot:$setup_time_slot)
    UserMailer.with(user: @users).notification_email.deliver_later(wait: 1.minute)
    byebug
    client = Twilio::REST::Client.new(
      TWILIO_ACCOUNT_SID,
      TWILIO_AUTH_TOKEN
    )

    to_phone_number = '+918770834037' # Replace with the recipient's phone number
    from_phone_number = TWILIO_PHONE_NUMBER

    message = client.messages.create(
      from: from_phone_number,
      to: to_phone_number,
      body: 'Thank you for your purchase!'
    )

    puts "Message sent with SID: #{message.sid}"
    redirect_to order_path(@order)
  else
    if params[:user][:active].present? &&  params[:user][:active] == "1"
      if params[:user][:password].present?
        @users.password =  params[:user][:password] 
      else
        flash[:error] = 'Please enter password before continuing'
        @users.active = false
        return render :new, status: :unprocessable_entity
      end
    end
      if @users.save
          @cart.update(user_id:@users.id)
          @order = Order.create(total_amount:@cart.total, payment_mode:"Cash on Delivery",payment_status:"Not Done",cart_id:@cart.id, setup_time: $setup_time, setup_time_slot:$setup_time_slot)
          UserMailer.with(user: @users).notification_email.deliver_later(wait: 1.minute)
          redirect_to order_path(@order)
      else
          render :new, status: :unprocessable_entity
      end
  end

  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name, :email,:phone,:password,:encrypted_password,:country_code,:steet_address,:total_guests,:company_name,:city,:closest_steet_address,:state, :zip_code, :additional_notes, :active,:terms_of_service)
  end
end
