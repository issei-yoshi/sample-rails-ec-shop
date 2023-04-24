class CartsController < ApplicationController
  def show
    @carts = current_cart.cart_items
  end

  def add_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])

    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def delete_item
  end
end
