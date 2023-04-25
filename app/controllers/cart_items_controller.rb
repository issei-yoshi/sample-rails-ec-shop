class CartItemsController < ApplicationController
  def create
    @cart_item = current_cart.cart_items.find_or_initialize_by(item_id: params[:item_id])
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to carts_path
  end
end
