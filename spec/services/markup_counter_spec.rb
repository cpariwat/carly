require 'rails_helper'

RSpec.describe MarkupCounter, type: :service do
  context '#count_pattern_on_webpage' do
    before do
      # fixture file has 50 'a'
      stub_request(:get, 'http://reuters.com')
          .to_return(body: File.open(File.join(Rails.root, '/spec/fixtures/files/reuters.html')))
    end

    it 'counts matches on html file' do
      counts = MarkupCounter.new.count_pattern_on_webpage(/a/, 'http://reuters.com')
      expect(counts).to eq 50
    end
  end

  context '#count_element_on_feed' do
    before do
      # fixture file has 51 pubDate elements
      stub_request(:get, 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
          .to_return(body: File.open(File.join(Rails.root, '/spec/fixtures/files/yourlocalguardian.rss')))
    end

    it 'counts matches on html file' do
      counts = MarkupCounter.new.count_element_on_feed('pubDate', 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
      expect(counts).to eq 51
    end
  end
end