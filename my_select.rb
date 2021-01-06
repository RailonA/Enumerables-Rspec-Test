require_relative 'my_each'

module Enumerable
  def my_select
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    index = 0

    arr.my_each do |_item|
      arr.delete_at(index) unless yield arr[index]
      index += 1
    end

    arr
  end
end
