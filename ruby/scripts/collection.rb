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

  def conformed_units?
    items_units = []
    
    @items.each { |item| items_units.push(item.unit) }

    items_units.uniq.size == 1 ? true : false
  end

  def conform_all_units(unit_to_swap)
    unless unit_to_swap == 'g' || unit_to_swap == 'oz'
      puts "Please try again passing either (g) or (oz) as argument"
      return
    end
    
    @items.each do |item|
      if item.unit != unit_to_swap
        item.switch_units
      end
    end
  end

  def order_asc
    unless self.conformed_units?
      puts "Units not conformed please #conform_all_units before ordering"
      return
    end
    
    @items.sort! { |a, b| a.weight <=> b.weight }
  end

  def order_desc
    unless self.conformed_units?
      puts "Units not conformed please #conform_all_units before ordering"
      return
    end
    
    @items.sort! { |a, b| b.weight <=> a.weight }
  end

  def average
    unless self.conformed_units?
      puts "Units not conformed please #conform_all_units before averaging"
      return
    end
    
    items_weights = []
    @items.each { |item| items_weights.push(item.weight) }
    items_weights.sum / items_weights.length
  end

  def total
    unless self.conformed_units?
      puts "Units not conformed please #conform_all_units before totaling"
      return 
    end
    
    items_weights = []
    @items.each { |item| items_weights.push(item.weight) }
    items_weights.sum
  end

end

# col1 = Collection.new('col1')
# ball = Item.new('ball', 5, 'oz')
# col1.add_item(ball)

# bat = Item.new('bat', 500, 'g')
# col1.add_item(bat)


# col1.conform_all_units('h')

# # puts col1.total