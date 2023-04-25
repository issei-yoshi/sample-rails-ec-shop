# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/order
class OrderPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/order/creation_email
  def creation_email
    OrderMailer.creation_email
  end
end
