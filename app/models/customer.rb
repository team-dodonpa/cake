class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :deliveries
         has_many :cart_details
         has_many :orders
#退会機能
  #def active_for_authentication?
    #super && (self.is_valid == false)
  #end

end
