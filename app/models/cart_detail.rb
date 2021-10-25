class CartDetail < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  belongs_to :order
  def sum_of_price
    item.price * amount
  end
  def sum_of_cart_price
    #cart_detail.item.price * amount
  end 
end
