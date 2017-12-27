class BibleVerse::Verse
  attr_accessor :title, :description, :url
  @@all = []

    def self.new_from_topic(post)
      topic = self.new
      verse.title = post.css("h1").text
      verse.description = post.css("div.scripture div span:nth-child(2)").text.strip
      if topic.title != ""
        topic.save
      end
    end

    def initialize(title=nil, description=nil, url=nil)
      @title = title
      @description = description
      @url = url
    end

    def self.all
      @@all
    end

    def self.reset_all
      @@all.clear
    end

    def save
      @@all << self
    end

    def self.find(id)
      self.all[id-1]
    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end
  end
