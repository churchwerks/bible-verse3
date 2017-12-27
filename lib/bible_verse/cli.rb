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
    BibleVerse::Topic.(1)
    puts "What Verse would you like to see? Enter a number."
    input = gets.downcase
    display_verse(input)
  end

  def display_verse(input)
    puts "display_verse called with input = #{input}"
    #BibleVerse::Vscraper.new.make_verses
    puts "What Verse(V) or Topic(T) would you like to see? Enter V or T."
    puts "Enter Q to exit the program."
    input = gets.downcase
    goodbye
  end

  def goodbye
    puts "goodbye called"
  end
end
