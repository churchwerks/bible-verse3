class BibleVerse::CLI
  def call
    puts "Topical Bible Verses"
    list_topics
    menu
    goodbye
  end

  def list_topics
    puts "Topical Bible Verses"
    puts <<~DOC
      1. Peace Bible Verses - Bible Verses About Peace - Description
      2. Encouraging Bible Verses - Encouraging Bible Verses and Quotes - Description
    DOC
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
      else
        puts "Not sure what you mean, type list or exit."
      end
    end
  end

  def goodbye
    puts "Peace be with you"
  end
end
