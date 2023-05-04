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

    code = current_cart.promotion_code
    promotion_code = PromotionCode.find_by(code: code)
    @discount = promotion_code&.discount || 0
    @order.discount = @discount
    @order.billing_amount = current_cart.total_price - @discount

    if @order.buy
      session[:cart_id] = nil
      OrderMailer.creation_email(@order).deliver_now
      promotion_code&.update(
        used: 1
      )
      flash[:notice] = '購入ありがとうございます'
      redirect_to items_path
    else
      @carts = current_cart.cart_items
      render 'carts/show', status: :unprocessable_entity
    end
  end

  def basic
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :user_name, :email, :address, :address_building,
                                  :postal_code, :cardholder_name, :card_number, :card_expiration, :card_cvv)
  end
end
