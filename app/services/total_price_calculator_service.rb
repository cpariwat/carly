# Calculate total_price based on base_price according to pricing policy type of
# the organization

class TotalPriceCalculatorService
  def initialize(base_price, pricing_policy)
    @base_price = base_price
    @pricing_policy = pricing_policy
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
    count_pattern_on_webpage(/a/, 'http://reuters.com') / 100.0
  end

  def fixed_margin
    count_pattern_on_webpage(/(status)/, 'https://developer.github.com/v3/#http-redirects')
  end

  def prestige_margin
    count_element_on_feed('pubDate', 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
  end

  def count_pattern_on_webpage(regex, on_url)
    count = 0
    web = Nokogiri::HTML(open(on_url))
    web.traverse {|x|
      if x.text?
        matches = x.text.scan(regex)
        count += matches.size
      end
    }
    count
  end

  def count_element_on_feed(element, on_url)
    feed = Nokogiri::XML(open(on_url))
    feed.search(element).count
  end
end