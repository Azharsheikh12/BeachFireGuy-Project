class UserMailer < ApplicationMailer
  # default from: 'whitefank9@gmail.com'

  def notification_email
    @user = params[:user]
    mail(to: @user.email, :subject => 'Ordered sucessfully', :from => "sandiegobonfires@gmail.com")
  end

  def order_successfull_email
    @user = params[:user]
    mail(to: @user&.email, :subject => 'Order Approved', :from => "sandiegobonfires@gmail.com")
  end
end
