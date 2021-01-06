module Enumerable
    def my_none
        raise 'NO BLOCK GIVEN!' unless block_given?
        arr = to_a
        arr.my_each_with_index do |_item, index|
        return false if yield arr[index]
        end
        true
    end
end