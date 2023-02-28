require_relative 'item'

class Collection
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end

  def get_count
    @items.count
  end

end

# col1 = Collection.new('col1')
# ball = Item.new('ball', 5, 'oz')
# col1.add_item(ball)
