class BibleVerse::VerseScraper
  def get_page(topic)
    Nokogiri::HTML(open("https://www.biblestudytools.com/#{topic}-bible-verses/"))
  end

  def scrape_topics
    self.get_page.css(".list-group-item")
  end

  def make_topics
    scrape_topics.each do |t|
      BibleVerse::Topics.new_from_featured_topics(t)
    end
  end
end
