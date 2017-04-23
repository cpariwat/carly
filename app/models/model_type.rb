class ModelType < ActiveRecord::Base
  belongs_to :model

  validates :model_type_slug, presence: true, uniqueness: true

  delegate :organization, to: :model, allow_nil: true

  def total_price
    total_price_calculator = TotalPriceCalculatorService.new(base_price, organization.pricing_policy)
    total_price_calculator.calculate
  end
end
