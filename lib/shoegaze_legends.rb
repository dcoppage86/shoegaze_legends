require_relative './shoegaze_legends/version'
require_relative './shoegaze_legends/cli'
require_relative './shoegaze_legends/scraper'
require_relative './shoegaze_legends/album'

require 'bundler'
Bundler.require
require 'nokogiri'
require 'open-uri'

module ShoegazeLegends
  class Error < StandardError; end

  interface = ShoegazeLegends::CLI.new
  interface.call
end
