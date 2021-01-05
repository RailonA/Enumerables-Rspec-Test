module Enumerable
    def my_each_with_index
        arr = to_a
        i =0
        while i < arr.length
            yield arr[i], i
            i +=1
        end

        return arr
    end
end