# require 'rspec'
# require 'pg'
# require 'task'
#
# # DB is a constant. Made available everywhere in the program. Use VERY rarely.
# DB = PG.connect({:dbname => 'to_do_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM tasks *;")
#   end
# end
#
# describe(Task) do
#   # 2
#   describe("#save") do
#     it("adds a task to the array of saved tasks") do
#       test_task = Task.new({:description => "learn SQL"})
#       test_task.save()
#       expect(Task.all()).to(eq([test_task]))
#     end
#   end
# #makes sure two objects with same props are treated the same spec 1
#   describe('#==') do
#     it('is the same task if it has the same description') do
#       task1 = Task.new({:description => "learn SQL"})
#       task2 = Task.new({:description => "learn SQL"})
#       expect(task1).to(eq(task2))
#     end
#   end
# end
