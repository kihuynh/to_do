require 'rspec'
require 'pg'
require 'list'

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe(List) do

  describe('.all') do
    it("it starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  # describe("#save") do
  #   it("lets you save lists to the database") do
  #     list = List.new({:name => "Epicodus stuff", :id => nil})
  #     list.save()
  #     expect(List.all()).to(eq[list])
  #   end
  # end

  # 1
  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil })
      expect(list1).to(eq(list2))
    end
  end
end
