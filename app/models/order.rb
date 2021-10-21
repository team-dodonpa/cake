class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validate :customer_id, :address, :name, :posta
end
