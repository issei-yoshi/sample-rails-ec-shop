class CartsController < ApplicationController
  def show
    @carts = current_cart.cart_items
  end

  def add_item
  end
end
