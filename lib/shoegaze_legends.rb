require_relative './shoegaze_legends/version'
require_relative './shoegaze_legends/cli'
require_relative './shoegaze_legends/album'
require_relative './shoegaze_legends/scraper'

require 'bundler'
Bundler.require
require 'pry'
require 'open-uri'
require 'net/http'
require 'JSON'


module ShoegazeLegends
  class Error < StandardError; end
  # Your code goes here...
end
