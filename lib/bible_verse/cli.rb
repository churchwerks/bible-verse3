class BibleVerse::CLI

  def call
    BibleVerse::Tscraper.new.make_topics
    puts "Welcome to Bible Verses by Topic "
    start
  end

  def start

  end
end
