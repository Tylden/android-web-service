class API::V1::ContactsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # def index
  #   # Initialise instance vairable (@var)
  #   @contacts = Contact.all
  #   # Configure JBuilder format
  #   respond_to do |format|
  #     format.json { render :json => { contacts: @contacts } }
  #   end
  # end

  # def fetch_contact
  #   @contact = Contact.find_by_id(params[:id])
  # end

  def index
    # Initialise instance vairable (@var)
    @contacts = Contact.all
    respond_to do |format|
      # Configure JBuilder format
      format.json { render json: @contacts }
      format.xml { render xml: @contacts }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @contact }
      format.xml { render xml: @contact }
    end
  end

  def create
    @contact = Contact.new(contact_params)
    #@contact.temp_password = Devise.friendly_token
    @contact.id = nil
    respond_to do |format|
      if @contact.save
        format.json { render json: @contact, status: :created }
        format.xml { render xml: @contact, status: :created }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
        format.xml { render xml: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @contact = Contact.find_by_id(params[:id])
    respond_to do |format|
      if @contact.update_attributes() #params[:contact]
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
        format.xml { render xml: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find_by_id(params[:id])
    respond_to do |format|
      if @contact.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
        format.xml { render xml: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:id, :first_contact, :last_contact)
  end

end
