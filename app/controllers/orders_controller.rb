class OrdersController < ApplicationController
   #会員のみ閲覧可能
    #before_action :authenticate_customer!

    def index
      @customer = current_customer
      @order = @customer.orders
      @cart_details = @customer.cart_details

    end

    def show
      @order = Order.find(params[:id])
    end

    def edit
    end

    def new
      @customer = current_customer
      @order = Order.new
      @deliverys = Delivery.all
    end

    def confirm
      @order = Order.new(order_params)
      @order.shipping_cost = 800
      cart_items = current_customer.cart_details
      total = @order.shipping_cost
      cart_items.each do |cart_item|
        total += cart_item.item.price*cart_item.amount*1.1
      end
      @order.total_payment = total
      @cart_details = current_customer.cart_details
      @order.payment_method = params[:order][:payment_method]
      @order.customer_id = current_customer.id
      if params[:order][:address_option] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.first_name + current_customer.last_name
      elsif params[:order][:address_option] == "1"
        @delivery = Delivery.find(params[:order][:delivery_id])
        @order.postal_code = @delivery.postal_code
        @order.address = @delivery.address
        @order.name = @delivery.address_name
      elsif params[:order][:address_option] == "2"
      end
    end

    def complete
    end

    def create
      @order = Order.new(order_params)
      @order.customer = current_customer
      @order.shipping_cost = 800
      @order.save
      cart_items = current_customer.cart_details
      total_price = 0

      cart_items.each do |cart_item|
        @order_detail = @order.order_details.new
        @order_detail.price = cart_item.item.price
        @order_detail.amount = cart_item.amount
        @order_detail.item_id = cart_item.item_id
        @order_detail.making_status = 0
        @order_detail.save
        total_price += cart_item.item.price*cart_item.amount*1.1
      end
      total_price += @order.shipping_cost
      @order.total_payment = total_price
      @order.status = 0
      @order.save

        cart_items.destroy_all
      redirect_to complete_orders_path
    end

    def update
    end

    private
    def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method,:shipping_cost, :total_payment, :status)
    end

end
