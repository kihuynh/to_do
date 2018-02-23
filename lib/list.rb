class List
  attr_reader(:name, :id)

  def initialize(attributes)
    name = attributes.fetch(:name)
  end

  def self.all
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i()
      lists.push(List.new({:name => name, :id => nil}))
    end
    lists
  end
  
  # def save
  #   result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
  # end
  def ==(another_list)
    self.name().==(another_list.name()).&(self.id().==(another_list.id()))
  end
end
