require 'rspec'
require 'pg'
require 'list'

# this will be initialize with an ID so we can add Tasks instances of List

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

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
end
