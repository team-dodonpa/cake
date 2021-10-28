class Admin::CustomersController < ApplicationController
     before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
  end
  
  private
  	def customer_params
  		params.require(:customer).permit(:email,:encrypted_password,:reset_password_token,:reset_password_sent_at,:remember_created_at,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_deleted,:update_at,:created_at)

  	end
end
