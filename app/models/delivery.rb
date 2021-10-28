class Delivery < ApplicationRecord
#会員情報と紐付け
    belongs_to :customer
#バリデーション設定
    validates :address_name, :address, presence: true
    validates :postal_code, numericality: { only_integer: true }

def address_all
    postal_code + address + address_name
end
  
end
