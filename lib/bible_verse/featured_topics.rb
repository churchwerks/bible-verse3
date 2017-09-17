class BibleVerse::FeaturedTopics
  attr_accessor :topics, :headers, :descriptions, :urls

  def self.list_topics
    puts <<~DOC
      1. Peace Bible Verses - Bible Verses About Peace - Description
      2. Encouraging Bible Verses - Encouraging Bible Verses and Quotes - Description
    DOC
  end
end
