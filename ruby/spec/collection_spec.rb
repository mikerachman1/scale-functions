require_relative '../scripts/collection'
require_relative '../scripts/item'

describe 'Collection' do
  it '#add_item method puts added items in @items instance array' do
    i = Item.new('ball', 5, 'oz')
    c = Collection.new('collection_1')
    c.add_item(i)
    expect(c.get_count).to eq 1
  end

  it '#conformed_units? returns false if units of items are not all the same' do
    i = Item.new('ball', 5, 'oz')
    b = Item.new('bat', 40, 'g')
    c = Collection.new('collection_1')
    c.add_item(i)
    c.add_item(b)
    expect(c.conformed_units?).to be false
  end

  it '#conformed_units? returns true if units of items are all the same' do
    i = Item.new('ball', 5, 'oz')
    b = Item.new('bat', 40, 'oz')
    c = Collection.new('collection_1')
    c.add_item(i)
    c.add_item(b)
    expect(c.conformed_units?).to be true
  end

  it '#conform_all_units sends error message if argument is incorrect' do
    i = Item.new('ball', 5, 'oz')
    b = Item.new('bat', 40, 'g')
    c = Collection.new('collection_1')
    c.add_item(i)
    c.add_item(b)
    expect(c.conform_all_units('lbs')).to be nil
  end

  it '#conform_all_units method conforms all items to the same units' do
    i = Item.new('ball', 5, 'oz')
    b = Item.new('bat', 40, 'g')
    c = Collection.new('collection_1')
    c.add_item(i)
    c.add_item(b)
    c.conform_all_units('g')
    expect(c.conformed_units?).to be true
  end

  it '#order_asc method orders items by weights in ascending order' do
    i = Item.new('ball', 40, 'oz')
    b = Item.new('bat', 5, 'oz')
    c = Collection.new('collection_1')
    c.add_item(i)
    c.add_item(b)
    c.order_asc
    expect(c.items[0]).to be b
  end

  it '#order_desc method orders items by weights in descending order' do
    i = Item.new('ball', 5, 'oz')
    b = Item.new('bat', 40, 'oz')
    c = Collection.new('collection_1')
    c.add_item(i)
    c.add_item(b)
    c.order_desc
    expect(c.items[0]).to be b
  end

  it '#average method returns average of all weights in collection' do
    i = Item.new('ball', 6, 'oz')
    b = Item.new('bat', 40, 'oz')
    c = Collection.new('collection_1')
    c.add_item(i)
    c.add_item(b)
    expect(c.average).to eq 23
  end

  it '#total method returns total of all weights in collection' do
    i = Item.new('ball', 6, 'oz')
    b = Item.new('bat', 40, 'oz')
    c = Collection.new('collection_1')
    c.add_item(i)
    c.add_item(b)
    expect(c.total).to eq 46
  end
  
end