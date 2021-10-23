class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#配送先とカートと注文に紐付け
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :deliveries
         has_many :cart_details
         has_many :orders
 #バリデーション設定
        validates :first_name, :first_name_kana, :last_name, :last_name_kana, :address, :email, :address, presence: true
        validates :telephone_number, numericality: { only_integer: true }

#退会機能
  #def active_for_authentication?
    #super && (self.is_valid == false)
  #end

end
