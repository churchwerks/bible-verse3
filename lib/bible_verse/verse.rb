class BibleVerse::Verse
  attr_accessor :book, :chapter, :number, :body, :url, :title, :description
  @@all_verses = []

  def self.save
    @@all_verses << self
  end

  def make
    verse_1 = self.new
    verse_1.book = "Colossians"
    verse_1.chapter = "3"
    verse_1.number = "15"
    verse_1.body = "Let the peace of Christ rule in your hearts, since as members of one body you were called to peace. And be thankful."
    verse_1.url = "http://www.biblestudytools.com/colossians/3-15.html"
    save
    verse_2 = self.new
    verse_2.category = "Galatians"
    verse_2.chapter = "5"
    verse_2.number = "22"
    verse_2.body = "Let the peace of Christ rule in your hearts, since as members of one body you were called to peace. And be thankful."
    verse_2.url = "But the fruit of the Spirit is love, joy, peace, forbearance, kindness, goodness, faithfulness,"
    save
    [verse_1, verse_2]
  end
  def make_verse
    verse = Verse.new
    post = self.get_page
    verse.title = post.css("h1").text
    verse.description = post.css("div.scripture div span:nth-child(2)").text.strip
    verse.save
  end
  def print_verse
    self.make_verse
    Verse.all.each do |verse|
      if verse.title != ""
        puts "Verse: #{verse.title}"
        puts "   #{verse.description}"
      else
        puts "ERROR"
      end
    end
  end
end
