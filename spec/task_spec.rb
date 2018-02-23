require 'rspec'
require 'pg'
require 'task'
require 'spec_helper'

# require that TASK to belong to a list and initialized with an id


describe(Task) do
  # 2
  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  # this one doesn't need to be defined. just finding what the desc output is
  describe("#description") do
  it("lets you read the description out") do
    test_task = Task.new({:description => "learn SQL", :list_id => 1})
    expect(test_task.description()).to(eq("learn SQL"))
  end
end
#makes sure two objects with same props are treated the same spec 1
  describe('#==') do
    it('is the same task if it has the same description') do
      task1 = Task.new({:description => "learn SQL", :list_id => 1})
      task2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end
end
