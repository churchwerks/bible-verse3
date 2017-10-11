class BibleVerse::CLI
  def call
    puts "Topical Bible Verses"
    list_topics
    menu
  end

  def list_topics
    @topics = BibleVerse::Topics.list_topics
    @topics.each do |topic|
      counter = 1
      puts "  #{counter}.#{topic.category}"
      counter += 1
    end

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
      puts "Enter the number of the Topical Bible Verses you would like to search:
      or type list to see more, or exit to quit."
      input = gets.strip.downcase
      case input
      when "1"
        puts "Showing Bible Verses About Peace"

      when "2"
        puts "Showing Encouraging Bible Verses and Quotes"
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
