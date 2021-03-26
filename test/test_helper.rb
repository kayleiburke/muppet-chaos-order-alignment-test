require 'minitest/autorun'
require 'minitest/unit'
require 'mocha/minitest'
require 'pry'
Dir.glob('./lib/*/*/*.rb').each { |file| require file }
Dir.glob('./lib/*/*.rb').each { |file| require file }