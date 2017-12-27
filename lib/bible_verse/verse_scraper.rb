class BibleVerse::Vscraper
  def get_page(topic=faith)
    Nokogiri::HTML(open("https://www.biblestudytools.com/topical-verses/#{topic}-bible-verses/"))
  end

  def scrape_verses
    self.get_page.css(".list-group-item")
  end

  def make_verses
    scrape_verses.each do |v|
      BibleVerse::verse.new_from_featured_topics(v)
    end
  end
end
