class Genre < ApplicationRecord
  has_many :products, dependent: :destroy
  #validate :name, {presence: true}
  attachment :image
  has_many :items 
end
