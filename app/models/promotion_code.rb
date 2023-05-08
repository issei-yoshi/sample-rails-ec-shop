# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  with_options presence: true do
    validates :code
    validates :discount
  end

  validates :code, uniqueness: true

  enum :used, { inactivated: 0, activated: 1 }
end
