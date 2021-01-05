require_relative 'my_each'

module Enumerable
  def my_select

    arr = to_a
    index = 0
    count = 0

    arr.my_each do |_item|
      
      index += 1
    end

    count
  end
end