class MarkupCounter
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