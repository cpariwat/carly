# Calculate total_price based on base_price according to pricing policy type of
# the organization

class TotalPriceCalculatorService
  def initialize(base_price, pricing_policy)
    @base_price = base_price
    @pricing_policy = pricing_policy
    @markup_counter = MarkupCounter.new
  end

  def calculate
    total_price = case @pricing_policy
                    when Organization.pricing_policies[:flexible]
                      @base_price * flexible_margin
                    when Organization.pricing_policies[:fixed]
                      @base_price + fixed_margin
                    when Organization.pricing_policies[:prestige]
                      @base_price + prestige_margin
                    else
                      0
                  end
    total_price
  end

  private

  def flexible_margin
    @markup_counter.count_pattern_on_webpage(/a/, 'http://reuters.com') / 100.0
  end

  def fixed_margin
    @markup_counter.count_pattern_on_webpage(/(status)/,
                                             'https://developer.github.com/v3/#http-redirects')
  end

  def prestige_margin
    @markup_counter.count_element_on_feed('pubDate',
                                          'http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
  end
end