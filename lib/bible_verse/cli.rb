class BibleVerse::CLI
  def call
    puts "Topical Bible Verses"
    list_topics
  end

  def list_topics
    puts <<-DOC
      1. Peace Bible Verses - Bible Verses About Peace - Description
      2. Encouraging Bible Verses - Encouraging Bible Verses and Quotes - Description
    DOC
  end
end
