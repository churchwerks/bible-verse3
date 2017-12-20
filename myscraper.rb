require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'

html = open("https://www.biblestudytools.com/topical-verses/")

doc = Nokogiri::HTML(html)
verses = doc.css(".xl-h3.list-group-item-heading")
binding.pry
puts verses
