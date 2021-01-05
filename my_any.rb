module Enumerable
  def my_select
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    index = 0
    any = false

    arr.my_each do |_item|
      any = true if yield arr[index]

      index += 1
    end

    any
  end
end
