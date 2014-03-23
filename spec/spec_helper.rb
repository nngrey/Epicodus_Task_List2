require 'rspec'
require 'task'
require 'list'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'task_list_test'})

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM tasks *;")
		DB.exec("DELETE FROM lists *;")
	end
end