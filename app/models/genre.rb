class Genre < ApplicationRecord
  has_many :products, dependent: :destroy
  #validate :name, {presence: true}
  attachment :image
end
