class ContactsController < ApplicationController
  protect_from_forgery except: :null
    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save 
         redirect_to new_contact_path
         flash[:success] = 'Message Sent Successfully!'
      else 
         render :new, status: :unprocessable_entity  
      end
    end
   
    private
    def contact_params
        params.require(:contact).permit(:first_name,:last_name, :email,:subject,:message)
    end

end
