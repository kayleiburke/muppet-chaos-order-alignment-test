# frozen_string_literal: true
require "pry-byebug"
require "csv"

questions = CSV.parse(File.read("questions.csv"), headers: true)
ratings = CSV.parse(File.read("ratings.csv"), headers: true)
muppets = CSV.parse(File.read("muppets.csv"), headers: true)
ratings_values = CSV.parse(File.read("ratings_values.csv"), headers: true)
