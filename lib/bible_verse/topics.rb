class BibleVerse::Topic
  attr_accessor  :title, :description, :url
  @@all = []

  def self.new_from_featured_topic(t)
    self.new(
      t.css(".xl-h3.list-group-item-heading").text,


  end

  def initialize(title=nil, category=nil, description=nil, url=nil)
    @category = category
    @title = title
    @description = description
    @url = url

  end

  def self.all
    @@all
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
