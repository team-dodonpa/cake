class Admin::OrderDetailsController < ApplicationController

   before_action :authenticate_admin!

   def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
       redirect_to admin_order_path(@order_detail.order)
    else
		     render "show"
    end
   end


end