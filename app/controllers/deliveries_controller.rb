class DeliveriesController < ApplicationController

  def index
    @customer = current_customer
    @delivery = Delivery.new
    @deliveries = @customer.deliveries
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer = current_customer
    if @delivery.save
       redirect_to deliveries_path
    else
      @customer = current_customer
      @deliveries = @customer.deliveries
      flash[:notice] = "入力内容を確認してください"
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
        @delivery = Delivery.find(params[:id])
     if @delivery.update(delivery_params)
        redirect_to deliveries_path
     else
        flash[:notice] = "入力内容を確認してください"
        render :edit
     end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

 private
  def delivery_params
    params.require(:delivery).permit(:last_name, :first_name, :postal_code, :address, :last_name_kana, :first_name_kana, :address_name, :customer_id)
  end

end
