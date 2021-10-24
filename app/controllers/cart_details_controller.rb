class CartDetailsController < ApplicationController
  def index
        @cart_items = current_customer.cart_items
  end

  def create
  end

  def update
    
    @cart_item.update(quantity: params[:amount].to_i)
    redirect_to current_customer
  end
  

  def destroy
    @cart_item.destroy
    redirect_to current_customer
  end
  
  def destroy_all
  end
  
  private

  def setup_cart_details!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end
end
