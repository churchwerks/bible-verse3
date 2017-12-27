class BibleVerse::Tscraper
    def get_page
      Nokogiri::HTML(open("https://www.biblestudytools.com/topical-verses/"))
    end

    def get_topics
      self.get_page.css(".list-group-item")
    end

    def make_topics
      get_topics.each do |t|
        BibleVerse::Topic.new_from_featured_topics(t)
        binding.pry
      end
    end

    def print_topics
      self.make_topics
      Topic.all.each do |topic|
        puts "Topic: #{topic.title}"
        puts "  Description: #{topic.description}"
        puts "  Link: #{topic.url}"
        puts ""
      end
    end
  end

  TopicScraper.new.print_topics
