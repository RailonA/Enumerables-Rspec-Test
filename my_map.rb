module Enumerable
    def my_map
        raise 'NO BLOCK GIVEN!' unless block_given?
        arr = to_a
        arr.my_each_with_index do |_item, index|
            arr[index] = yield arr[index]
        end
    end
end