require_relative '../scripts/item'

describe 'Item' do
  it 'rejects item intialization if unit is not (g) or (oz)' do
    expect { Item.new('ball', 5, 'lbs') }.to raise_error
  end

  it 'swaps from oz to g properly' do
    i = Item.new('ball', 5, 'oz')
    i.switch_units
    expect(i.weight).to eq 141.7475
  end

  it 'swaps from g to oz properly' do
    i = Item.new('ball', 141.7475, 'g')
    i.switch_units
    expect(i.weight).to eq 5
  end

  it 'changes unit when using #switch_unit method' do
    i = Item.new('ball', 141.7475, 'g')
    i.switch_units
    expect(i.unit).to eq 'oz'
    i.switch_units
    expect(i.unit).to eq 'g'
  end

  it 'returns tared value with #tare method' do
    i = Item.new('ball', 141.7475, 'g')
    expect(i.tare(40)).to eq 101.7475
  end

  it 'changes weight of item to tared value with #tare! method' do
    i = Item.new('ball', 141.7475, 'g')
    i.tare!(40)
    expect(i.weight).to eq 101.7475
  end
end