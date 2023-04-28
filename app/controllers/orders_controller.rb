# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :basic, only: %i[index show]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.cart = current_cart

    if @order.buy
      session[:cart_id] = nil
      OrderMailer.creation_email(@order).deliver_now
      flash[:notice] = '購入ありがとうございます'
      redirect_to items_path
    else
      @carts = current_cart.cart_items
      render 'carts/show', status: :unprocessable_entity
    end
  end

  def basic
    authenticate_or_request_with_http_basic do |name, password|
      name == 'admin' && password == 'pw'
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :user_name, :email, :address, :address_building,
                                  :postal_code, :cardholder_name, :card_number, :card_expiration, :card_cvv)
  end
end
