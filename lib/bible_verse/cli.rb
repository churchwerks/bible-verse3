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
    puts "What Featured Topic would you like to see? Enter a number."
    input = gets.strip.to_i
    display_topic(input)
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
    puts "Hit Enter to display the verses or Q to quit."
    input = gets.downcase
    display_verses(url)
  end

  def display_verses(url)
    BibleVerse::Vscraper.get_verses(url)
    counter = 0
    BibleVerse::Verse.all.each.with_index do |post, index|
      if post.title != ""
        puts "#{index+1}. #{post.title}"
        counter += 1
      end
    end
    if counter != 0
      puts "What Verse would you like to see? Enter a number."
      input = gets.strip.to_i
      verse = BibleVerse::Verse.find(input)
      puts "Verse: #{verse.title}"
      puts "   #{verse.description.strip}"
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
