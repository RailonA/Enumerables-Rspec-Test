module Enumerable
    def my_all
        raise 'NO BLOCK GIVEN!' unless block_given?
        arr = to_a
        arr.my_each_with_index do |_item, index|
        return false unless yield arr[index]
        end
        true
    end
end