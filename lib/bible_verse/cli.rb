class BibleVerse::CLI

  def call
    BibleVerse::Scraper.new.make_items
    puts "Welcome to Bible Verses by Topic "
    start
  end

  def start
    puts ""
    puts "What Featured Topic would you like to see?"
    BibleVerse::Topic.all.each.with_index do |post, index|
      puts ""
      puts "#{index+1}. #{post.title}"
      puts ""
      #puts "#{post.description}"
      #puts "#{post.url}"
    end
    input = gets.strip.to_i
  end

  def select_topic

  end
end
