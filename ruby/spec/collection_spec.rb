require_relative '../scripts/collection'

describe 'Collection' do
  it '#add_item method puts added items in @items instance array'

  it '#get_count method returns count of items in collection'

  it '#conformed_units? returns false if units of items are not all the same'

  it '#conformed_units? returns true if units of items are all the same'

  it '#conform_all_units method conforms all items to the same units'

  it '#order_asc method orders items by weights in ascending order'

  it '#order_desc method orders items by weights in descending order'

  it '#average method returns average of all weights in collection'

  it '#total method returns total of all weights in collection'

  it '#order_asc, #order_desc, #average, #total methods check #conformed_units? before doing their work'
end