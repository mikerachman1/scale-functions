require_relative 'item'

class Collection
  attr_reader :name
  attr_accessor :items

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

  def conform_all_units(unit_to_swap)
    unless unit_to_swap == 'g' || unit_to_swap == 'oz'
      puts "Please try again passing either (g) or (oz)"
    else
      @items.each do |item|
        if item.unit != unit_to_swap
          item.switch_units
        end
      end
    end
  end

  def order_asc

  end

  def order_desc
  end

  def average
  end

  def total
  end

  def conformed_units?
    items_units = []
    
    @items.each do |item|
      items_units.push(item.unit)  
    end

    items_units.uniq.size == 1 ? true : false
  end

end

col1 = Collection.new('col1')
ball = Item.new('ball', 5, 'oz')
col1.add_item(ball)

bat = Item.new('bat', 500, 'g')
col1.add_item(bat)

puts col1.conformed_units?

col1.conform_all_units('g')

puts col1.conformed_units?
