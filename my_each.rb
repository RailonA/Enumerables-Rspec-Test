module Enumerable
    def my_each
        arr = to_a
        i =0
        while i < arr.length
            yield arr[i]
            i +=1
        end
    end
end

numbers = [1,3,5]
puts numbers.my_each {|x| puts x*x}