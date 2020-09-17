require_relative './shoegaze_legends/version'
require_relative './shoegaze_legends/cli'
require_relative './shoegaze_legends/scraper'
require_relative './shoegaze_legends/album'
require_relative './shoegaze_legends/artist'

require 'bundler'
Bundler.require
require 'pry'
require 'open-uri'

doc = Nokogiri::HTML(open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"))


module ShoegazeLegends
  class Error < StandardError; end
  # Your code goes here...
end
