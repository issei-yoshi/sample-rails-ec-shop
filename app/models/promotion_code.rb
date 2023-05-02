class PromotionCode < ApplicationRecord
  with_options presence: true do
    validates :code
    validates :discount
  end

  validates :code, uniqueness: true
end
