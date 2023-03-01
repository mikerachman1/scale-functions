class Item 
  @@quantity = 0
  
  attr_reader :name
  attr_accessor :weight, :unit

  def initialize(name, weight, unit)
    # check for valid units
    unless unit == "g" || unit == "oz"
      puts "VALID UNITS ARE (g) OR (oz)"
    else
      @name = name
      @weight = weight
      @unit = unit
      @@quantity += 1
    end
  end

  def switch_units
    if @unit == 'oz'
      # change weight to g
      @weight = @weight * 28.3495
      @unit = 'g'
    else
      # change weight to oz
      @weight = @weight / 28.3495
      @unit = 'oz'
    end
  end

  def tare(value)
    # returns tared weight
    @weight - value
  end

  def tare!(value)
    # reassignes weight to tared value
    @weight = @weight - value
  end

  def self.item_count 
    return @@quantity
  end
end
