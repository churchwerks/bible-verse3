class BibleVerse::Tscraper
  #
    def get_page
      Nokogiri::HTML(open("https://www.biblestudytools.com/topical-verses/"))
    end

    def get_topics
      self.get_page.css(".list-group-item")
    end

    def make_topics
      get_topics.each do |t|
        topic = self.new
          topic.title = t.css(".xl-h3.list-group-item-heading").text
          topic.description = t.css("p").text
          topic.url = t.css("a").attribute("href").value
          if topic.title != ""
            topic.save
          end
        end
        BibleVerse::Topic.new_from_featured_topics(t)
      end
    end
  end
#
