require 'rails_helper'

RSpec.describe MarkupCounter, type: :service do
  context '#count_pattern_on_webpage' do
    it 'counts matches on html file' do
      counts = MarkupCounter.new.count_pattern_on_webpage(/a/, 'http://reuters.com')
      expect(counts).to eq 50       # fixture file has 50 'a'
    end
  end

  context '#count_element_on_feed' do
    it 'counts matches on html file' do
      counts = MarkupCounter.new.count_element_on_feed('pubDate', 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
      expect(counts).to eq 51  # fixture file has 51 pubDate elements
    end
  end
end