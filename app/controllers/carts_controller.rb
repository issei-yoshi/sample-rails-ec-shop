# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @carts = current_cart.cart_items
    @order = Order.new
    @code = current_cart.promotion_code
    @discount = PromotionCode.find_by(code: @code)&.discount || 0
  end
end
