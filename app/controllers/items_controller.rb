class ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(8)
    @items_all = Item.all
  end


 def show
  @item = Item.find(params[:id])
  #@cart_detail = CartDetail.new
   def add_item
    if @cart_item.blank?
      @cart_item = current_customer.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.amount += params[:amount].to_i
    @cart_item.save
    redirect_to current_customer
   end
 end

end
