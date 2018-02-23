class List
  attr_reader(:name, :id)

  def initialize(attributes)
    name = attributes.fetch(:name)
  end

  def ==(another_list)
    self.name().==(another_list.name()).&(self.id().==(another_list.id()))
  end
end
