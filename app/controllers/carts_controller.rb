# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_item, only: %i[add_item delete_item]

  def show
    @carts = current_cart.cart_items
  end

  def add_item
    @cart_item = current_cart.cart_items.build(item_id: params[:item_id]) if @cart_item.blank?

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to carts_path
  end

  def delete_item
    @cart_item.delete
    redirect_to carts_path
  end

  private

  def set_cart_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
end
