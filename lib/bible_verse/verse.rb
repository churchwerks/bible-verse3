class BibleVerse::Verse
  attr_accessor :title, :description, :url
  @@all = []

    def self.new_from_topic(v)
      verse = self.new
      verse.title = v.css(".list-group-item-heading").text
      verse.description = v.css("div.scripture div span:nth-child(2)").text.strip
      if verse.title != ""
        verse.save
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

  end
