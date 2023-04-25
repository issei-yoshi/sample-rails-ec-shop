# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @carts = current_cart.cart_items
  end

  def create
    @cart_item = current_cart.cart_items.find_or_initialize_by(item_id: params[:item_id])
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to carts_path
  end

  def destroy
    @cart_item = current_cart.cart_items.find_by!(item_id: params[:item_id])
    @cart_item.delete
    redirect_to carts_path
  end
end
