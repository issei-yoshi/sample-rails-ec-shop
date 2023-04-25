class OrdersController < ApplicationController

  def index
    @orders = Order.all
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
