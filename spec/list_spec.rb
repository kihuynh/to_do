require 'rspec'
require 'pg'
require 'list'
require 'spec_helper'

# this will be initialize with an ID so we can add Tasks instances of List


describe(List) do
  # 2
  describe('.all') do
    it("it starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end
  # 4 this spec will pass fairly easily because it's just looking for the same list.name. no worries about initializing
  describe('#name') do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  # 4 won't know what ID it will have. so just check if it's an integer instead
  describe('#id') do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id).to(be_an_instance_of(Integer))
    end
  end
  # 3
  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  # 1
  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil })
      expect(list1).to(eq(list2))
    end
  end

  # 5
  describe('.find') do
    it("returns a list by its ID") do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_list2 = List.new({:name => "Home stuff", :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end

  describe('#tasks') do
    it("returns an array of tasks for that list") do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_task = Task.new({:description => "learn SQL", :list_id => test_list.id()})
      test_task.save()
      test_task2 = Task.new({:description => "Review Ruby", :list_id => test_list.id()})
      test_task2.save()
      expect(test_list.tasks()).to(eq([test_task, test_task2]))
    end
  end

  describe('#update') do
    it("lets you update lists in the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      list.update({:name => "Homework stuff"})
      expect(list.name()).to(eq("Homework stuff"))
    end
  end

  describe('#delete') do
    it("deletes a list's tasks from the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      task = Task.new({:description => "learn SQL", :list_id => list.id})
      task.save()
      list.delete()
      expect(Task.all()).to(eq([]))
    end
  end
end
