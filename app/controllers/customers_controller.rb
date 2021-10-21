class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
     customer.update(customer_params)
      redirect_to customer_path(@customer_id)
  end



  def quit
  end
  def out
  end

  def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to customer_path(@customer)
  end
  private
  	def customer_params
  		params.require(:customer).permit(:email,:encrypted_password,:reset_password_token,:reset_password_sent_at,:remember_created_at,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_deleted,:update_at,:created_at)

  	end
end
