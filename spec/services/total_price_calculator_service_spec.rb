require 'rails_helper'

RSpec.describe TotalPriceCalculatorService, type: :service do
  context '#calculate' do
    let(:base_price) { 10000 }

    context 'with flexible pricing policy' do
      it 'calculate total price base on how many letter a found on http://reuters.com' do
        # letters 'a' count divided by 100
        expected_margin = 50 / 100.00

        total_price = TotalPriceCalculatorService.new(base_price,'flexible').calculate
        expect(total_price).to eq base_price * expected_margin
      end
    end

    context 'with fixed pricing policy' do
      before do
        # fixture file has 8 'status'
        stub_request(:get, 'https://developer.github.com/v3/')
            .to_return(body: File.open(File.join(Rails.root, '/spec/fixtures/files/github-http-redirect.html')))

      end
      it 'calculates total price base on  how many words status found on github documentation' do
        expected_margin = 8

        total_price = TotalPriceCalculatorService.new(base_price,'fixed').calculate
        expect(total_price).to eq base_price + expected_margin
      end
    end

    context 'with prestige pricing policy' do
      before do
        # fixture file has 51 pubDate elements
        stub_request(:get, 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
            .to_return(body: File.open(File.join(Rails.root, '/spec/fixtures/files/yourlocalguardian.rss')))
      end

      it 'calculates total price base on how many pubDate elements found on yourlocalguardian feed' do
        expected_margin = 51

        total_price = TotalPriceCalculatorService.new(base_price,'prestige').calculate
        expect(total_price).to eq base_price + expected_margin
      end
    end
  end
end