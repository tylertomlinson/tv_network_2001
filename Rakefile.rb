require "rake/testtask"

task default: %w[test]

Rake::TestTask.new do |task|
 task.pattern = "test/*_test.rb"
end
