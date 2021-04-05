class AddressesController < ApplicationController
  before_action :current_address, except: %i[new create]
  before_action :set_current_user, except: :destroy

  def new
    @address = @user.addresses.new
  end

  def create
    if @user.addresses.create(address_params)
      flash[:notice] = "Address added"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Address could not be added"
      render :new
    end
  end

  def edit;  end

  def update
    if @address.update(address_params)
      flash[:notice] = "Address Updated"
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "Address Updation failed"
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def address_params
    params.require(:address).permit(:house_number, :colony, :street, :city, :state)
  end

  def id_param
    params.permit(:id)
  end

  def current_address
    @address = current_user.addresses.find_by_id(id_param[:id])
    render 'error' and return if @address.nil?
  end
end
