class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :cart_details




  enum status: {waiting: 0,checked: 1,making: 2,ready: 3,sent: 4}
  enum payment_method: {credit: 0,cash: 1}
  # enum name: {"ご自身の住所":0,"登録済住所から選択":1,"新しいお届け先":2}
end
