# rubocop:disable Metrics/LineLength
require_relative '../my_enumerables.rb'

describe Enumerable do

    let(:array) { [1, 2, 3, 4, 5, 7, 8, 22, 55, 34, 86] }
    let(:all_odd_array) { [1, 3, 5, 7, 9, 11] }
    let(:negative_array) { [-8, -9, -6] }
    let(:false_array) { [1, false, 'hi', []] }

    # my_each
    describe '#my_each' do
        it 'return an array' do
            expect(array.my_each{|element| element * 2}).to eq(array.each{|element| element * 2})
        end
    end

    # my_each_with_index
    describe '#my_each_with_index' do
        it 'return an array' do
            expect(array.my_each_with_index{|element, index| element * 2}).to eq(array.each_with_index{|element, index| element * 2})
        end
    end

    # my_select
    describe '#my_select' do
        it 'my_select should return odd array' do
            expect(array.my_select{|x| x%2 == 0}).to eq(array.select{|x| x%2 == 0})
        end
    end


    # my_all
    describe '#my_all' do
      it 'my_all should return false' do
          expect(array.my_all{|x| x.even? }).to eq(array.all?{|x| x.even? })
      end
    end


    # my_any
    describe '#my_any' do
      it 'my_any should return true' do
          expect(array.my_any{|x| x.even? }).to eq(array.any?{|x| x.even? })
      end
    end


    # my_none
    describe '#my_none' do
      it 'my_none should return false' do
          expect(array.my_none{|x| x.even? }).to eq(array.none?{|x| x.even? })
      end
    end


    # my_none
    describe '#my_none' do
      it 'my_none should return false' do
          expect(array.my_none{|x| x.even? }).to eq(array.none?{|x| x.even? })
      end
    end


    # my_count
    describe '#my_count' do
      it 'my_count should be equal to count' do
          expect(array.my_count).to eq(array.count)
      end
    end


    # my_count_with_arg
    describe '#my_count' do
        arr = [1,2,2,2,3]
        it 'my_count should be equal to count' do
            expect(arr.my_count(2)).to eq(arr.count(2))
        end
    end


    # my_inject
    describe '#my_inject' do
      it 'my_inject should return the same Total' do
          expect(array.my_inject{|total, element| total + element}).to eq(array.inject{|total, element| total + element})
      end
    end


    # my_map_with_block
    describe '#my_map' do
      it 'my_map should return the same as map' do
          expect(array.my_map{|element| element * 5 }).to eq(array.map{|element| element * 5 })
      end
    end

    # my_map_with_Proc
    describe '#my_map' do
      procc = Proc.new{|element| element * 10}
      it 'my_map should return the same as map' do
          expect(array.my_map(&procc)).to eq(array.map(&procc))
      end
    end
    
end