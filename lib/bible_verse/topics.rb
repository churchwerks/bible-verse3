class BibleVerse::Topics
  attr_accessor :category, :title, :description, :url

  def self.list_topics
    puts <<~DOC
      1. Peace Bible Verses - Bible Verses About Peace - Description
      2. Encouraging Bible Verses - Encouraging Bible Verses and Quotes - Description
    DOC

    topic_1 = self.new
    topic_1.category = "Peace Bible Verses"
    topic_1.title = "Bible Verses About Peace"
    topic_1.description = "Read verses that offer guidance on subjects such as peace of mind, love and peace, peacefulness and joy."
    topic_1.url = "http://www.biblestudytools.com/topical-verses/peace-bible-verses/"

    topic_2 = self.new
    topic_2.category = "Encouraging Bible Verses"
    topic_2.title = "Encouraging Bible Verses and Quotes "
    topic_2.description = "The below Scriptures will offer encouragement in your daily life and provide inspiration and strength as you cope with life's challenges."
    topic_2.url = "http://www.biblestudytools.com/topical-verses/encouraging-bible-verses/"

    [topic_1, topic_2]
  end
end
