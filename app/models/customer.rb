class Customer < ApplicationRecord
	has_many :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries
  has_many :orders, dependent: :destroy

  def active_for_authentication?
    super && (self.is_customer_active == false)
  end

end
