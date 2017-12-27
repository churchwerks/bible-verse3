class BibleVerse::Topic
attr_accessor :title, :description, :url
@@all = []

  def self.new_from_featured_topics(post)
    topic = self.new
    topic.title = post.css(".xl-h3.list-group-item-heading").text
    topic.description = post.css("p").text
    topic.url = post.css("a").attribute("href").value
    if topic.title != ""
      self.save
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

  def best_dish
    @best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
  end

  def food_style
    @food_style ||= doc.xpath("//div[@class='c-4 nr nt']/ul[2]/li").text
  end

  def contact
    @contact ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[1]").text.split("+").join(". Tel: +")
  end

  def head_chef
    @head_chef ||= doc.xpath("//div[@class='c-4 nr nt']/ul[1]/li").text.split(" (pictured)").join("")
  end

  def website_url
    @website_url ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[2]/a").text
  end

  def description
    @description ||= doc.xpath("//div[@class='c-8 nl nt']/p[3]").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
