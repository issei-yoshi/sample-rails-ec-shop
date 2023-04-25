# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :address_building
      t.string :postal_code, null: false
      t.string :cardholder_name, null: false
      t.string :card_number, null: false
      t.string :card_expiration, null: false
      t.integer :card_cvv, null: false
      t.integer :billing_amount, null: false

      t.timestamps
    end
  end
end
