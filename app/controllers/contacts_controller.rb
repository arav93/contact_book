class ContactsController < ApplicationController

    before_action :set_contact, only: [:show, :update, :destroy] 

    def index
        @contacts = Contact.all 
        render :json => @contacts
    end

    def create
        @contact = Contact.create!(contact_params)
        render :json => @contact
        rescue ActiveRecord::RecordInvalid => invalid
            render :json => {error: invalid.record.errors}  
    end

    def show
        render :json => @contact
    end

    def update
        @contact.update(contact_params)
        render :json => @contact 
        rescue ActiveRecord::RecordInvalid => invalid
            render :json => {error: invalid.record.errors}       
    end

    def destroy
        @contact.destroy
        render :json => {message: 'Contact deleted'}
    end

    def search
        case search_params[:search_type]
        when 'name'
            contact = Contact.where(name: search_params[:value]).page(search_params[:page]).to_a
        when 'email'
            contact = Contact.where(email: search_params[:value]).page(search_params[:page]).to_a
        end
        render :json => contact
    end


    private

    def contact_params
        params.permit(:name, :email, :phone)
    end

    def search_params
        params.permit(:search_type, :value, :page)
    end

    def set_contact
        @contact = Contact.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render :json => {message: 'Contact not found'} 
    end
end
