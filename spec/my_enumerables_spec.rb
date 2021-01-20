require_relative '../my_enumerables'

describe Enumerable do
  let(:my_array) { [1, 2, 3, 4, 5] }
  let(:my_hash) { { x: 1, y: 2, z: 3 } }
  let(:my_text) { %w[ant bear cat] }
  let(:arg) { proc { |value| value * 2 } }
  let(:my_range) { (1..9) }

  describe '#my_each' do
    it 'Test my_array.my_each to return the same as my_array.each' do
      expect(my_array.my_each(&:even?)).to eql(my_array.each(&:even?))
    end
    it 'Test my_range.my_each to return the same as my_range.each' do
      expect(my_range.my_each(&:even?)).to eql(my_range.each(&:even?))
    end
    it 'Test my_hash.my_each to return the same as my_hash.each' do
      expect(my_hash.my_each { |value| value }).to eql(my_hash.each { |value| value })
    end
  end

  describe '#my_each_with_index' do
    it ' Test my_array.my_each_with_index to return the same as my_array.each_with_index' do
      expect(my_array.my_each_with_index { |value| value }).to eql(my_array.each { |value| value })
    end
    it ' Test my_range.my_each_with_index to return the same as my_range.each_with_index' do
      expect(my_range.my_each_with_index { |value| value }).to eql(my_range.each { |value| value })
    end
    it ' Test my_hash.my_each_with_index to return the same as my_hash.each_with_index' do
      expect(my_hash.my_each_with_index { |value| value }).to eql(my_hash.each { |value| value })
    end
  end

  describe '#my_select' do
    it ' Test my_array.my_each_with_index to return the same as my_array.each_with_index' do
      expect(my_array.my_select { |value|  value }).to eql(my_array.select { |value| value })
    end
    it ' Test my_range.my_each_with_index to return the same as my_range.each_with_index' do
      expect(my_range.my_select { |value| value }).to eql(my_range.select { |value| value })
    end
    it ' Test my_hash.my_each_with_index to return the same as my_hash.each_with_index' do
      # expect(my_hash.my_select{  |key, value|   value }).to eql(my_hash.select{ |key, value|   value })
    end
  end

  describe '#my_all?' do
    it ' Test my_array.my_all? to return the same as my_array.all?' do
      expect(my_array.my_all? { |value| value }).to eql(my_array.all? { |value| value })
    end
    it ' Test my_array.my_all?(Numeric) to return the same as my_array.all?(Numeric)' do
      expect(my_array.my_all?(Numeric)).to eql(my_array.all?(Numeric))
    end
    it ' Test my_range.my_all? { |value| value } to return the same as my_range.all? { |value| value }' do
      expect(my_range.my_all? { |value| value }).to eql(my_range.all? { |value| value })
    end
    it ' Test my_range.my_all?(Numeric to return the same as my_range.all?(Numeric)' do
      expect(my_range.my_all?(Numeric)).to eql(my_range.all?(Numeric))
    end
    it ' Test my_hash.my_all? { |_key, value| value } to return the same as my_hash.all? { |_key, value| value }' do
      expect(my_hash.my_all? { |_key, value| value }).to eql(my_hash.all? { |_key, value| value })
    end
    it ' Test my_text.my_all? { |word| word.length >= 3 } to return the same as my_text.all? { |word| word.length >= 3 }' do
      expect(my_text.my_all? { |word| word.length >= 3 }).to eql(my_text.all? { |word| word.length >= 3 })
    end
    it ' Test my_text.my_all?(/t/) to return the same as my_text.all?(/t/)' do
      expect(my_text.my_all?(/t/)).to eql(my_text.all?(/t/))
    end
  end

  describe '#my_any?' do
    it ' Test .my_any? to return the same as .all?' do
      expect(my_array.my_any? { |value| value }).to eql(my_array.any? { |value| value })
      expect(my_array.my_any?(Numeric)).to eql(my_array.any?(Numeric))
      expect(my_range.my_any? { |value| value }).to eql(my_range.any? { |value| value })
      expect(my_range.my_any?(Numeric)).to eql(my_range.any?(Numeric))
      expect(my_hash.my_any? { |_key, value| value }).to eql(my_hash.any? { |_key, value| value })
      expect(my_text.my_any? { |word| word.length >= 3 }).to eql(my_text.any? { |word| word.length >= 3 })
      expect(my_text.my_any?(/t/)).to eql(my_text.any?(/t/))
    end
  end

  describe '#my_none?' do
    it ' Test .my_any? to return the same as .all?' do
      expect(my_array.my_none? { |value| value }).to eql(my_array.none? { |value| value })
      expect(my_array.my_none?(Numeric)).to eql(my_array.none?(Numeric))
      expect(my_range.my_none? { |value| value }).to eql(my_range.none? { |value| value })
      expect(my_range.my_none?(Numeric)).to eql(my_range.none?(Numeric))
      expect(my_hash.my_none? { |_key, value| value }).to eql(my_hash.none? { |_key, value| value })
      expect(my_text.my_none? { |word| word.length >= 3 }).to eql(my_text.none? { |word| word.length >= 3 })
      expect(my_text.my_none?(/t/)).to eql(my_text.none?(/t/))
    end
  end

  describe '#my_count' do
    it ' Test .my_count to return the same as .count?' do
      expect(my_array.my_count{ |value| value }).to eql(my_array.count { |value| value })
      expect(my_array.my_count(Numeric)).to eql(my_array.count(Numeric))
      expect(my_range.my_count{ |value| value }).to eql(my_range.count { |value| value })
      expect(my_range.my_count(Numeric)).to eql(my_range.count(Numeric))
      expect(my_hash.my_count{ |_key, value| value }).to eql(my_hash.count { |_key, value| value })
      expect(my_text.my_count{ |word| word.length >= 3 }).to eql(my_text.count { |word| word.length >= 3 })
      expect(my_text.my_count(/t/)).to eql(my_text.count(/t/))
    end
  end


  describe '#my_map' do
    it ' Test .my_map to return the same as .map?' do
      expect(my_array.my_map{ |value| value }).to eql(my_array.map { |value| value })
      expect(my_range.my_map{ |value| value }).to eql(my_range.map { |value| value })
      expect(my_hash.my_map{ |_key, value| value }).to eql(my_hash.map { |_key, value| value })
      expect(my_text.my_map{ |word| word.length >= 3 }).to eql(my_text.map { |word| word.length >= 3 })
    end
  end

  describe '#my_inject' do
    it ' Test .my_inject to return the same as .count?' do
      expect(my_array.my_inject{ |value| value }).to eql(my_array.inject { |value| value })
      expect(my_range.my_inject{ |value| value }).to eql(my_range.inject { |value| value })
      expect(my_hash.my_inject{ |_key, value| value }).to eql(my_hash.inject { |_key, value| value })
    end
  end


  describe '#my_count' do
    it ' Test .my_count to return the same as .count?' do
      expect(my_array.my_count{ |value| value }).to eql(my_array.count { |value| value })
      expect(my_array.my_count(Numeric)).to eql(my_array.count(Numeric))
      expect(my_range.my_count{ |value| value }).to eql(my_range.count { |value| value })
      expect(my_range.my_count(Numeric)).to eql(my_range.count(Numeric))
      expect(my_hash.my_count{ |_key, value| value }).to eql(my_hash.count { |_key, value| value })
      expect(my_text.my_count{ |word| word.length >= 3 }).to eql(my_text.count { |word| word.length >= 3 })
      expect(my_text.my_count(/t/)).to eql(my_text.count(/t/))
    end
  end

end
