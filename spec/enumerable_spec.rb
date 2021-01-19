# rubocop:disable Metrics/LineLength
require_relative '../my_enumerables.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5, 7, 8, 22, 55, 34, 86] }
  procc = proc { |element| element * 10 }
  range = 1..5

  describe '#my_each' do
    # my_each -- array
    it 'my_each should return an array' do
      expect(array.my_each(&:even?)).to eq(array.each(&:even?))
    end
    # my_each -- range
    it 'my_each should return an array' do
      expect(range.my_each(&:even?)).to eq(range.each(&:even?))
    end
  end

  describe '#my_each_with_index' do
    # my_each_with_index
    it 'my_each should return an array' do
      expect(array.my_each_with_index { |element, _index| element * 2 }).to eq(array.each_with_index { |element, _index| element * 2 })
    end
    # my_each_with_index -- range
    it 'return an array from a range' do
      expect(range.my_each_with_index { |element, index| element * index }).to eq(range.each_with_index { |element, index| element * index })
    end
  end

  describe '#my_select' do
    # my_select
    it 'my_select should return even array' do
      expect(array.my_select(&:even?)).to eq(array.select(&:even?))
    end
    # my_select -- range
    it 'my_select should return even array from range' do
      expect(range.select(&:even?)).to eq(range.select(&:even?))
    end
  end

  describe '#my_all?' do
    # my_all -- array
    it 'my_all should return false' do
      expect(array.my_all?(&:even?)).to eql(array.all?(&:even?))
    end
    # my_all without block or args
    it 'my_all should return false' do
      expect([nil, true, 99].my_all?).to eq([nil, true, 99].all?)
    end
    # my_all -- Class
    it 'my_all should return true' do
      expect(range.my_all?(Numeric)).to eql(range.all?(Numeric))
    end
    # my_all -- Pattern
    it 'my_all should return false' do
      expect(%w[ant bear cat].my_all?(/t/)).to eql(%w[ant bear cat].all?(/t/))
    end
  end

  describe '#my_any?' do
    # my_any
    it 'my_any should return true' do
      expect(array.my_any?(&:even?)).to eq(array.any?(&:even?))
    end
    # my_any without block or args
    it 'my_any should return true' do
      expect([nil, true, 99].my_any?).to eq([nil, true, 99].any?)
    end
    # my_any -- Class
    it 'my_any should return true' do
      expect(range.my_any?(Numeric)).to eql(range.any?(Numeric))
    end
    # my_any -- Pattern
    it 'my_any should return false' do
      expect(%w[ant bear cat].my_any?(/d/)).to eq(%w[ant bear cat].any?(/d/))
    end
  end

  describe '#my_none?' do
    # my_none
    it 'my_none should return false' do
      expect(array.my_none?(&:even?)).to eq(array.none?(&:even?))
    end
    # my_none with no block or pattern
    it 'my_none should return true' do
      expect([].my_none?).to eq([].none?)
    end
    # my_none -- class
    it 'my_none should return true' do
      expect(array.my_none?(String)).to eq(array.none?(String))
    end
    # my_none regex
    it 'my_none should return true' do
      expect(%w[ant bear cat].my_none?(/d/)).to eq(%w[ant bear cat].none?(/d/))
    end
  end

  describe '#my_count' do
    # my_count
    it 'my_count should be equal to count' do
      expect(array.my_count).to eq(array.count)
    end
    # my_count --arg
    it 'my_count should be equal to count' do
      arr = [1, 2, 2, 2, 3]
      expect(arr.my_count(2)).to eq(arr.count(2))
    end
    # my_count -- Block
    it 'my_count should be equal to count' do
      expect(array.my_count(&:even?)).to eq(array.count(&:even?))
    end
  end

  describe '#my_inject' do
    # my_inject
    it 'my_inject should return the same Total of a sum' do
      expect(array.my_inject { |total, element| total + element }).to eq(array.inject { |total, element| total + element })
    end
    # my_inject  -- Block and initial value
    it 'my_inject should return the same Total of a multiplication' do
      expect((5..10).my_inject(1) { |product, n| product * n }).to eq((5..10).inject(1) { |product, n| product * n })
    end
    # my_inject  --  Symbol
    it 'my_inject should return the same Total of a multiplication' do
      expect((5..10).my_inject(:*)).to eq((5..10).inject(:*))
    end
    # my_inject  --  initial value and symbol
    it 'my_inject should return the same Total of a sum' do
      expect((5..10).my_inject(12, :+)).to eq((5..10).inject(12, :+))
    end
  end

  describe '#my_map' do
    # my_map_with_block
    it 'my_map should return the same as map' do
      expect(array.my_map { |element| element * 5 }).to eq(array.map { |element| element * 5 })
    end
    # my_map_with_Proc
    it 'my_map should return the same as map' do
      expect(array.my_map(&procc)).to eq(array.map(&procc))
    end
  end
end

# rubocop:enable Metrics/LineLength
