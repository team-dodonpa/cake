class Admin::OrderDetailsController < ApplicationController

   before_action :authenticate_admin!

   def create
     @order_detail = OrderDetail.new(order_detail_params)
     if @order_detail.save
       redirect_to admin_order_path(@order_detail.order)
     else
       render "show"
     end
   end


   def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
        @order.order_details.each do |order_detail|
            if order_detail.making_status == "making"
                order_detail.order.update(status: "making")
            end
        end
        if @order.order_details.count == @order.order_details.where(making_status: "complete").count
            @order_detail.order.update(status: "ready")
        end
       redirect_to admin_order_path(@order_detail.order)
    else
		     render "show"
    end
   end

   private
   def order_detail_params
     params.require(:order_detail).permit(:making_status)
   end


end
