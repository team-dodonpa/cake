class CartDetail < ApplicationRecord
  belongs_to :customer,optional: true
  belongs_to :item,optional: true
  belongs_to :order,optional: true
  def sum_of_price
    item.price * amount
  end
  def sum_of_cart_price
    #cart_detail.item.price * amount
  end
end
