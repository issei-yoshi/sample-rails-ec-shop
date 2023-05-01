# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.creation_email.subject
  #
  def creation_email(order)
    @order = order

    mail(
      subject: '注文完了のお知らせ',
      to: @order.email
    )
  end
end
