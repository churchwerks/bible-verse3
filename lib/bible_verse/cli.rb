class BibleVerse::CLI

  def call
    BibleVerse::Tscraper.new.make_topics
    puts "Welcome to Bible Verses by Topic "
    start
  end

  def start
    puts ""
    BibleVerse::Topic.all.each.with_index do |post, index|
      puts ""
      puts "#{index+1}. #{post.title}"
      puts ""
    end
    puts "What Featured Topic would you like to see? Enter a number."
    input = gets.strip.to_i
    display_topic(input)
  end

  def display_topic(input)
    puts "display_topic called with input = #{input}"
    topic = BibleVerse::Topic.find(input)
    puts ""
    puts "#{topic.title}"
    puts ""
    puts "#{topic.description}"
    puts ""
    puts "#{topic.url}"
    puts ""
    url = topic.url
    BibleVerse::Verse.all.each.with_index do |post, index|
      puts ""
      puts "#{index+1}. #{post.title}"
      puts ""
    end
    display_verses(url)
  end

  def display_verses(url)
    display_verse(1)
  end

  def display_verse(input)
    puts "display_verse called with input = #{input}"
    #BibleVerse::Vscraper.new.make_verses
    puts "What Verse(V) or Topic(T) would you like to see? Enter V or T."
    puts "Enter Q to exit the program."
    input = gets.downcase
    goodbye
  end


  def print_verse
    BibleVerse::Verse.all.each do |verse|
      if verse.title != ""
        puts "Verse: #{verse.title}"
        puts "   #{verse.description}"
      else
        puts "ERROR"
      end
    end
  end
  def goodbye
    puts "goodbye called"
  end
end
