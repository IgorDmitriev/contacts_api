class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @contacts = @user.contacts + @user.shared_contacts
    
    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])

    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(user_params)
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    render json: @contact
  end

  def create
    @contact = contacts.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:user_id, :contact_id)
  end
end
