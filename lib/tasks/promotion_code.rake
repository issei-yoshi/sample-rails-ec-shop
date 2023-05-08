# frozen_string_literal: true

namespace :promotion_code do
  desc 'create 10 promotion codes'
  task generate: :environment do
    10.times do
      code = SecureRandom.alphanumeric(7)
      discount = Random.rand(100..1000).truncate(-1)
      PromotionCode.create(
        code: code,
        discount: discount
      )
    end
  end
end
