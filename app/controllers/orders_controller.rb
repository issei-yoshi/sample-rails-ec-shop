class OrdersController < ApplicationController
  before_action :basic, only: %i[index show]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    carts = current_cart.cart_items
    price = current_cart.total_price

    order = Order.new(order_params)
    order.billing_amount = price

    if order.save
      carts.each do |item|
        OrderDetail.create(
          order_id: order.id,
          item_id: item.item_id,
          quantity: item.quantity,
          price: item.item.price
        )
        item.destroy
      end
      flash[:notice] = '購入ありがとうございます'
      redirect_to items_path
    end
  end

  def basic
    authenticate_or_request_with_http_basic do |name, password|
      name == Rails.application.credentials.dig(:basic, :name) && password == Rails.application.credentials.dig(:basic, :password)
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :first_name,
      :last_name,
      :user_name,
      :email,
      :address,
      :address_building,
      :postal_code,
      :cardholder_name,
      :card_number,
      :card_expiration,
      :card_cvv
      )
  end
end
