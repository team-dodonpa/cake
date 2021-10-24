class OrdersController < ApplicationController
   #会員のみ閲覧可能
    before_action :authenticate_customer!

    def index
      @customer = current_customer
      @orders = @customer.orders
    end

    def show
    end

    def edit
    end

    def new
    end

    def confirm
    end

    def complete
    end

    def create
    end

    def update
    end
end
