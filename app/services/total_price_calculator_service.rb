# Calculate total_price based on base_price according to pricing policy type of
# the organization

class TotalPriceCalculatorService
  def initialize(base_price, pricing_policy)
    @base_price = base_price
    @pricing_policy = pricing_policy
  end

  def calculate
    # TODO: Logic for calculator here
  end
end