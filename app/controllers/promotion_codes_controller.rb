# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def create
    cart = current_cart
    code = params[:promo_code]
    promotion_code = PromotionCode.find_by(code: code)

    if promotion_code&.inactivated?
      cart.update(
        promotion_code: code
      )
      flash[:notice] = 'プロモーションコードが適用されました'
    else
      flash[:notice] = 'プロモーションコードが無効です'
    end
    redirect_to carts_path
  end
end
