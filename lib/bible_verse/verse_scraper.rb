class BibleVerse::Vscraper
  def self.get_verses(url)
    doc = Nokogiri::HTML(open("#{url}"))
    verses = doc.css(".list-group-item.bst-list-group-item-dark.no-top")
  end

  def make_verses
    verses.each do |v|
      title = v.css(".list-group-item-heading").text
      description = v.css(".scripture").text.strip
      url = v.css("a").attribute("href").value
      verse = BibleVerse::Verse.new(title,description,url)
      verse.save
    end
  end
end
