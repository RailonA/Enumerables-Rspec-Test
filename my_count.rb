require_relative 'my_each'

module Enumerable
  def my_count(arg = nil)
    arr = to_a

    return arr.length if arg.nil?

    index = 0
    count = 0

    arr.my_each do |_item|
      count += 1 if arg == arr[index]
      index += 1
    end

    count
  end
end
