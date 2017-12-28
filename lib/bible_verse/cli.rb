class BibleVerse::CLI
  def call
    BibleVerse::Tscraper.new.make_topics
    puts "Welcome to Bible Verses by Topic "
    puts ""
    start
  end

  def start
    BibleVerse::Topic.all.each.with_index do |post, index|
      puts ""
      puts "#{index+1}. #{post.title}"
      puts ""
    end
    puts "What Featured Topic would you like to see? Enter a number, or enter zero 0 to quit."
    input = gets.to_i
    input == "0" ? goodbye : display_topic(input)
  end

  def display_topic(input)
    topic = BibleVerse::Topic.find(input)
    puts ""
    puts "#{topic.title}"
    puts ""
    puts "#{topic.description}"
    puts ""
    puts "#{topic.url}"
    puts ""
    url = topic.url
    puts "Enter D to display the verses or Q to quit."
    choice = gets.strip.downcase
    choice == "q" ? goodbye : display_verses(url,input)
  end

  def display_verses(url,input)
    BibleVerse::Vscraper.get_verses(url)
    counter = 0
    BibleVerse::Verse.all.each.with_index do |post, index|
      if post.title != ""
        puts "#{index+1}. #{post.title}"
        counter += 1
      end
    end
    if counter != 0
      puts "What Verse would you like to see? Enter a number, or enter zero 0 to quit."
      number = gets.strip.to_i
      if number != 0
        verse = BibleVerse::Verse.find(number)
        puts "Verse: #{verse.title}"
        puts "   #{verse.description}"
        puts ""
        puts "Would you like to see another Verse V or Topic T or Quit?"
        BibleVerse::Verse.reset_all
        choice = gets.strip.downcase
          if choice == "t"
            start
          elsif choice == "v"
          display_verses(url,input)
          else
            goodbye
          end
      end
    else
      puts "There are no verses to display, Hit Enter to continue, or Q to quit."
      choice = gets.strip.downcase
      choice == "q" ? goodbye : start
    end
  end

  def goodbye
    puts ""
    puts ""
    puts "Peace Be with You!"
    puts ""
    puts ""
  end
end
