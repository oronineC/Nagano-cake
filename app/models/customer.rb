class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_customer_active == false)
  end

  enum is_customer_active: { valid: true, withdrawal: false }
  validates :is_customer_active, inclusion: {in: ["valid", "withdrawal"]}

end
