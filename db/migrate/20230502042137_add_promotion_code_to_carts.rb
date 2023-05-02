class AddPromotionCodeToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :promotion_code, :string
  end
end
