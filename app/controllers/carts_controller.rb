# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @carts = current_cart.cart_items
  end

  def destroy
    @cart_item = current_cart.cart_items.find_by!(item_id: params[:item_id])
    @cart_item.destroy
    redirect_to carts_path
  end
end
