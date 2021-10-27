class Admin::OrdersController < ApplicationController

    before_action :authenticate_admin!

  def index
      @orders = Order.all.page(params[:page]).per(10)
  end

  def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    #@order.shipping_cost = 800
    if @order.update(order_params)
      if @order.status == "checked"
        @order.order_details.update_all(making_status: "waiting_for_make")
      end
      redirect_to admin_order_path(@order)
    else
      render "show"
    end
  end

 private
 def order_params
   params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment, :status)
 end

end
