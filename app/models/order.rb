# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy

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

  attr_accessor :cart, :order

  def buy
    transaction do
      cart.cart_items.each do |cart_item|
        order_details.build(
          order_id: id,
          item_name: cart_item.item.name,
          quantity: cart_item.quantity,
          price: cart_item.item.price
        )
      end
      cart.destroy
      save!
    end
  rescue StandardError => e
    Rails.logger.error e
    false
  end
end
