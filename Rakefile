# frozen_string_literal: true
require 'rake/testtask'

task default: :test
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*/*test.rb']
  t.verbose = true
end
