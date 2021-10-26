class OrdersController < ApplicationController
   #会員のみ閲覧可能
    before_action :authenticate_customer!

    def index
      @customer = current_customer
      @order = @customer.orders
      @cart_details = @customer.cart_details
    end

    def show
    end

    def edit
    end

    def new
      @customer = current_customer
      @order = Order.new
      @deliverys = Delivery.all
    end

    def confirm
      @order = Order.new
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
        @delivery = Delivery.new
        @delivery.customer = current_customer
      end
    end

    def complete
    end

    def create
      @order = Order.new(order_params)
      @order.customer = current_customer
      @order.save
      redirect_to complete_orders_path
    end

    def update
    end

    private
    def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method,:address_option) #:shipping_cost, :total_payment, :status,)
    end

end
