RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'http://reuters.com')
        .to_return(body: File.open(File.join(Rails.root, '/spec/fixtures/files/reuters.html')))

    stub_request(:get, 'https://developer.github.com/v3/')
        .to_return(body: File.open(File.join(Rails.root, '/spec/fixtures/files/github-http-redirect.html')))

    stub_request(:get, 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
        .to_return(body: File.open(File.join(Rails.root, '/spec/fixtures/files/yourlocalguardian.rss')))
  end
end