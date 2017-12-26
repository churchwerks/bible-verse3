class BibleVerse::CLI

  def call
    puts "Topical Bible Verses"
    #BibleVerse::Tscraper.new.make_topics
    binding.pry
    list_topics
    menu
  end

  def list_topics
    binding.pry
    puts "list topics"
  end

  def display_topic
    puts "Displaying Topic"
  end

  def display_verse
    puts "Displaying Verse"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the Topical Bible Verse you would like to search:
      or type list to see more, or exit to quit."
      input = gets.strip.downcase
      case input
      when "1"
        puts "Showing Bible Verses About Peace"
        display_topic
        display_verse
      when "2"
        puts "Showing Encouraging Bible Verses and Quotes"
        display_topic
        display_verse
      when "list"
        list_topics
      when "exit"
        puts "Peace be with you"
      else
        puts "Not sure what you mean, type list or exit."
      end
    end
  end
end
