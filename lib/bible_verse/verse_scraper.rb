class BibleVerse::Vscraper
  def self.get_verses(url)
    doc = Nokogiri::HTML(open("#{url}"))
    verses = doc.css(".list-group-item.bst-list-group-item-dark.no-top")
    verses.each do |v|
      BibleVerse::Verse.new_from_topic(v)
    end
  end
end
