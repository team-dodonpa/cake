class CustomersController < ApplicationController
#会員のみ閲覧可能
    #before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end



  def quit
  end
  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def update
     @customer = Customer.find(params[:id])
     if
      @customer.update(customer_params)
      flash[:notice] = "変更を完了しました"
      redirect_to customer_path(@customer)
     else
      flash[:notice] = "入力内容を確認してください"
      render :edit
     end
  end
  private
  	def customer_params
  		params.require(:customer).permit(:email,:encrypted_password,:reset_password_token,:reset_password_sent_at,:remember_created_at,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_deleted,:update_at,:created_at)

  	end

end
