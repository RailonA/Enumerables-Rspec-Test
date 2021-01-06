module Enumerable
      def my_map(pr=nil)
          raise 'NO BLOCK GIVEN!' unless block_given?
          arr = to_a
          if pr
            arr.my_each_with_index do |_item, index|
                arr[index] = proc.cal arr[index]
            end
          else
            arr.my_each_with_index do |_item, index|
                arr[index] = yield arr[index]
            end
          end
      end
  end
  
  pro = Proc.new{|x| x*2}
  
  [1,2,3].my_map(&pro)