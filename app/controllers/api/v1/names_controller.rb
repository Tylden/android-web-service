class API::V1::NamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # def index
  #   # Initialise instance vairable (@var)
  #   @names = Name.all
  #   # Configure JBuilder format
  #   respond_to do |format|
  #     format.json { render :json => { names: @names } }
  #   end
  # end

  # def fetch_name
  #   @name = Name.find_by_id(params[:id])
  # end

  def index
    # Initialise instance vairable (@var)
    @names = Name.all
    respond_to do |format|
      # Configure JBuilder format
      format.json { render json: @names }
      format.xml { render xml: @names }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @name }
      format.xml { render xml: @name }
    end
  end

  def create
    @name = Name.new(name_params)
    #@name.temp_password = Devise.friendly_token
    @name.id = nil
    respond_to do |format|
      if @name.save
        format.json { render json: @name, status: :created }
        format.xml { render xml: @name, status: :created }
      else
        format.json { render json: @name.errors, status: :unprocessable_entity }
        format.xml { render xml: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @name = Name.find_by_id(params[:id])
    respond_to do |format|
      if @name.update_attributes() #params[:name]
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @name.errors, status: :unprocessable_entity }
        format.xml { render xml: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @name = Name.find_by_id(params[:id])
    respond_to do |format|
      if @name.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @name.errors, status: :unprocessable_entity }
        format.xml { render xml: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def name_params
    params.require(:name).permit(:id, :first_name, :last_name)
  end

end
