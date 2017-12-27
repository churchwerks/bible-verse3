class BibleVerse::Topic
attr_accessor :title, :description, :url
@@all = []
#
  def self.new_from_featured_topics(post)
    topic = self.new
    topic.title = post.css(".xl-h3.list-group-item-heading").text
    topic.description = post.css("p").text
    topic.url = post.css("a").attribute("href").value
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
