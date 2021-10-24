class Item < ApplicationRecord
    attachment :image
    #belongs_to :genre
  validates :name, presence: true
  validates :price, presence: true
  #validates :genre_id, presence: true
  validates :introduction, presence: true
  validates :is_active, presence: true
end
