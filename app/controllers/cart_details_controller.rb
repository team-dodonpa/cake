class CartDetailsController < ApplicationController
  def index
  @cart_details = current_customer.cart_details
  @total = @cart_details.inject(0) { |sum, item| sum + item.sum_of_price}
  
  end

  def create
    if @cart_detail.blank?
      @cart_detail= current_customer.cart_details.build(item_id: params[:item_id])
    end

    @cart_detail.amount = params[:cart_detail][:amount].to_i
    @cart_detail.save
    redirect_to cart_details_path
  end

  def update
    @cart_detail = CartDetail.find(params[:id])
    @cart_detail.update(cart_detail_params)
    redirect_to cart_details_path
  end
  

  def destroy
    @cart_detail = CartDetail.find(params[:id])
    @cart_detail.destroy
    redirect_to cart_details_path
  end
  
  def destroy_all
    @cart_details = current_customer.cart_details
    @cart_details.destroy_all
    redirect_to cart_details_path
  end  
  private

  def setup_cart_details!
    @cart_detail = current_customer.cart_details.find_by(item_id: params[:item_id])
  end
  
  def cart_detail_params
    params.require(:cart_detail).permit(:amount, :item_id, :customer_id)
  end
end
