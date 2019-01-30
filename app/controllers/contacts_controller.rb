class ContactsController < ApplicationController

    before_action :set_contact, only: [:show, :update, :destroy] 

    def index
        @contacts = Contact.all 
        render :json => @contacts
    end

    def create
        @contact = Contact.create!(contact_params)
        render :json => @contact
    end

    def show
        render :json => @contact
    end

    def update
        @contact.update(contact_params)
        render :json => @contact
    end

    def destroy
        @contact.destroy
        return "Contact deleted"
    end


    private

    def contact_params
        params.permit(:name, :email, :phone)
    end

    def set_contact
        @contact = Contact.where(id: params[:id]).first
        return "Contact not found" if @contact.nil?
    end
end
