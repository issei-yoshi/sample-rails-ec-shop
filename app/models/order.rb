class Order < ApplicationRecord
  has_many :order_details

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :user_name
    validates :email
    validates :address
    validates :cardholder_name
    validates :card_number
    validates :card_expiration
    validates :card_cvv
    validates :billing_amount
    validates :postal_code
  end
end
