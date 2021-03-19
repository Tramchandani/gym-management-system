class AddressesController < ApplicationController
  def new
    @user = current_user
    @address = Address.new
  end

  def create
    @user = current_user
    if @user.addresses.create(address_params)
      flash[:notice] = "Address added"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Address could not be added"
      render :new
    end
  end

  def edit
    @address = Address.find_by_id(params[:id])
  end

  def update
    @address = Address.find_by_id(params[:id])
    if @address.update(address_params)
      flash[:notice] = "Address Updated"
      redirect_to user_path(session[:user_id])
    else
      flash[:notice] = "Address Updation failed"
      render :edit
    end
  end

  def destroy
    Address.find_by_id(params[:id]).destroy
    redirect_to user_path(session[:user_id])
  end

  private

  def address_params
    params.require(:address).permit(:house_number, :colony, :street, :city, :state)
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
