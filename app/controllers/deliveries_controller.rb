class DeliveriesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @delivery = Delivery.new
   # @deliveries = current_customer.delivery
  end

  def create
    @deliveries = Deliveries.new(deliveriesparams)
    @deliveries.save
    redirect_to deliveries
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
