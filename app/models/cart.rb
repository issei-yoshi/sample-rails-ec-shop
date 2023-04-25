# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def total_price
    cart_items.inject(0) { |i, cart_item| i + (cart_item.item.price * cart_item.quantity) }
  end

  def total_quantity
    cart_items.inject(0) { |i, cart_item| i + cart_item.quantity }
  end
end
