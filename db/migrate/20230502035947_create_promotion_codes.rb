# frozen_string_literal: true

class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_codes do |t|
      t.string :code, null: false, index: { unique: true }
      t.integer :discount, null: false
      t.integer :used, default: 0

      t.timestamps
    end
  end
end
