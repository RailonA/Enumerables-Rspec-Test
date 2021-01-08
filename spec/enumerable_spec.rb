# rubocop:disable Metrics/LineLength
require_relative '../my_enumerables.rb'

describe Enumerable do

    let(:array) { [1, 2, 3, 4, 5, 7, 8, 22, 55, 34, 86] }
    let(:all_odd_array) { [1, 3, 5, 7, 9, 11] }
    let(:negative_array) { [-8, -9, -6] }
    let(:false_array) { [1, false, 'hi', []] }
    procc = Proc.new{|element| element * 10}
    range = 1..5

    # my_each -- array
    describe '#my_each' do
        it 'return an array' do
            expect(array.my_each{|element| element * 2}).to eq(array.each{|element| element * 2})
        end
    end

    # my_each -- range
    describe '#my_each' do
        it 'return an array' do
            expect(range.my_each{|x| x.even?}).to eq(range.each{|x| x.even?})
        end
    end

    # my_each_with_index
    describe '#my_each_with_index' do
        it 'return an array' do
            expect(array.my_each_with_index{|element, index| element * 2}).to eq(array.each_with_index{|element, index| element * 2})
        end
    end

    # my_each_with_index -- range
    describe '#my_each_with_index' do
        it 'return an array' do
            expect(range.my_each_with_index{|element, index| element * 2}).to eq(range.each_with_index{|element, index| element * 2})
        end
    end

    # my_select
    describe '#my_select' do
        it 'my_select should return even array' do
            expect(array.my_select{|x| x%2 == 0}).to eq(array.select{|x| x%2 == 0})
        end
    end


    # my_select -- range
    describe '#my_select' do
        it 'my_select should return even array' do
            expect(range.select{|x| x.even?}).to eq(range.select{|x| x.even?})
        end
    end


    # my_all -- array
    describe '#my_all?' do
      it 'my_all should return false' do
          expect(array.my_all?{|x| x%2 ==0}).to eql(array.all?{|x|  x%2 ==0 })
      end
    end


    # my_all -- Pattern
    describe '#my_all?' do
      it 'my_all should return true' do
          expect(range.my_all?(Numeric)).to eql(range.all?(Numeric))
      end
    end


    # my_any
    describe '#my_any?' do
      it 'my_any should return true' do
          expect(array.my_any?{|x| x.even? }).to eq(array.any?{|x| x.even? })
      end
    end


    # my_any -- Pattern
    describe '#my_any?' do
      it 'my_any should return true' do
          expect(range.my_any?(Numeric)).to eq(range.my_any?(Numeric))
      end
    end


    # my_none
    describe '#my_none?' do
      it 'my_none should return false' do
          expect(array.my_none?{|x| x.even? }).to eq(array.none?{|x| x.even? })
      end
    end


    # my_none -- Pattern
    describe '#my_none?' do
      it 'my_none should return false' do
          expect(array.my_none?(String)).to eq(array.none?(String))
      end
    end


    # my_count
    describe '#my_count' do
      it 'my_count should be equal to count' do
          expect(array.my_count).to eq(array.count)
      end
    end

    # my_count --arg
    describe '#my_count' do
        arr = [1,2,2,2,3]
        it 'my_count should be equal to count' do
            expect(arr.my_count(2)).to eq(arr.count(2))
        end
    end


    # my_count -- Block
    describe '#my_count' do
      it 'my_count should be equal to count' do
          expect(array.my_count{|x| x.even?}).to eq(array.count{|x| x.even?})
      end
    end


    # my_inject
    describe '#my_inject' do
      it 'my_inject should return the same Total' do
          expect(array.my_inject{|total, element| total + element}).to eq(array.inject{|total, element| total + element})
      end
    end


    # my_inject  -- Block and initial value
    describe '#my_inject' do
      it 'my_inject should return the same Total' do
          expect((5..10).my_inject(1) { |product, n| product * n }).to eq((5..10).inject(1) { |product, n| product * n })
      end
    end


    # my_inject  --  Symbol
    describe '#my_inject' do
      it 'my_inject should return the same Total' do
          expect((5..10).my_inject(:*) ).to eq((5..10).inject(:*) )
      end
    end


    # my_inject  --  initial value and symbol
    describe '#my_inject' do
      it 'my_inject should return the same Total' do
          expect((5..10).my_inject(12,:+)).to eq((5..10).inject(12,:+) )
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
      it 'my_map should return the same as map' do
          expect(array.my_map(&procc)).to eq(array.map(&procc))
      end
    end
    
end