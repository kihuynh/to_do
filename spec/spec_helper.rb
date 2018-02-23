require 'rspec'
require 'pg'
require 'list'
require 'task'

# DB is a constant. Made available everywhere in the program. Use VERY rarely.
DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
    DB.exec("DELETE FROM lists *;")
  end
end
