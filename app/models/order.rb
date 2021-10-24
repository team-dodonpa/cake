class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy




  enum status: {"入金待ち":0,"入金確認":1,"制作中":2,"発送準備":3,"発送済み":4}
  enum payment_method: {"クレジッドカード":0,"銀行振り込み": 1}
end
