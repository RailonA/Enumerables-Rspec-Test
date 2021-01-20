# rubocop:disable Layout/LineLength

require_relative '../my_enumerables'

describe Enumerable do
  let(:my_array) { [1, 2, 3, 4, 5] }
  let(:my_hash) { { x: 1, y: 2, z: 3 } }
  let(:my_text) { %w[ant bear cat] }
  let(:arg) { proc { |value| value * 2 } }
  let(:my_range) { (1..9) }


  describe '#my_each' do
    it 'Compares the result of my_each enumerable after running through my_array to the original enumerable each' do
      expect(my_array.my_each(&:even?)).to eql(my_array.each(&:even?))
    end
    it 'Compares the result of my_each enumerable after running through my_range to the original enumerable each' do
      expect(my_range.my_each(&:even?)).to eql(my_range.each(&:even?))
    end
    it 'Compares the result of my_each enumerable after running through my_hash to the original enumerable each' do
      expect(my_hash.my_each { |key, value| puts "#{key} is #{value}" }).to eql(my_hash.each { |key, value| puts "#{key} is #{value}" })
    end
    it 'Compares the output of my_each enumerable after running through my_array without a block or argument is given' do
      expect(my_array.my_each.to_a).to eq(my_array.each.to_a)
    end
    it 'Compares the output of  my_each enumerable after running through my_range without a block or argument is given' do
      expect(my_range.my_each.to_a).to eq(my_range.each.to_a)
    end
    it 'Compares the output of  my_hash enumerable after running through my_hash without a block or argument is given' do
      expect(my_hash.my_each.to_a).to eq(my_hash.each.to_a)
    end
  end

  describe '#my_each_with_index' do
    it 'Compares the result of my_each_with_index enumerable after running through my_array to the original enumerable each_with_index' do
      expect(my_array.my_each_with_index { |value, index| puts "#{value} #{index}" }).to eql(my_array.each_with_index { |value, index| puts "#{value} #{index}" })
    end
    it 'Compares the result of my_each_with_index enumerable after running through my_range to the original enumerable each_with_index' do
      expect(my_range.my_each_with_index { |value, index| puts "#{value} #{index}" }).to eql(my_range.each_with_index { |value, index| puts "#{value} #{index}" })
    end
    it 'Compares the result of my_each_with_index enumerable after running through my_hash to the original enumerable each_with_index' do
      expect(my_hash.my_each_with_index { |value, index| puts "#{value} #{index}" }).to eql(my_hash.each_with_index { |value, index| puts "#{value} #{index}" })
    end
    it 'Compares the output of my_each_with_index enumerable after running through my_array without a block or argument is given' do
      expect(my_array.my_each_with_index.to_a).to eq(my_array.my_each_with_index.to_a)
    end
    it 'Compares the output of my_each_with_index enumerable after running through my_range without a block or argument is given' do
      expect(my_range.my_each_with_index.to_a).to eq(my_range.my_each_with_index.to_a)
    end
    it 'Compares the output of my_each_with_index enumerable after running through my_hash without a block or argument is given' do
      expect(my_hash.my_each_with_index.to_a).to eq(my_hash.my_each_with_index.to_a)
    end
  end

  describe '#my_select' do
    it 'Compares the result of my_select enumerable after running through my_array to the original enumerable select' do
      expect(my_array.my_select { |value| value }).to eql(my_array.select { |value| value })
    end
    it 'Compares the result of my_select enumerable after running through my_range to the original enumerable select' do
      expect(my_range.my_select { |value| value }).to eql(my_range.select { |value| value })
    end
    it 'Compares the result of my_select enumerable after running through my_hash to the original enumerable select' do
      expect(my_hash.my_select { |key, value| puts "#{key} is #{value}" }).to eql(my_hash.select { |key, value| puts "#{key} is #{value}" })
    end
    it 'Compares the output of my_select enumerable after running through my_array without a block given' do
      expect(my_array.my_select.to_a).to eql(my_array.select.to_a)
    end
    it 'Compares the output of my_select enumerable after running through my_range without a block given' do
      expect(my_range.my_select.to_a).to eql(my_range.select.to_a)
    end
    it 'Compares the output of my_select enumerable after running through my_hash without a block given' do
      expect(my_hash.my_select.to_a).to eql(my_hash.select.to_a)
    end
  end

  describe '#my_all?' do
    it 'Compares the result of my_all? enumerable after running through my_array to the original enumerable all?' do
      expect(my_array.my_all? { |value| value }).to eql(my_array.all? { |value| value })
    end
    it 'Compares the result of my_all? enumerable after running through my_array with (Numeric) to the original enumerable all?' do
      expect(my_array.my_all?(Numeric)).to eql(my_array.all?(Numeric))
    end
    it 'Compares the result of my_all? enumerable after running through my_range to the original enumerable all?' do
      expect(my_range.my_all? { |value| value }).to eql(my_range.all? { |value| value })
    end
    it 'Compares the result of my_all? enumerable after running through my_range with (Numeric) to the  to the original enumerable all?' do
      expect(my_range.my_all?(Numeric)).to eql(my_range.all?(Numeric))
    end
    it 'Compares the result of my_all? enumerable after running through my_hash to the original enumerable all?' do
      expect(my_hash.my_all? { |_key, value| value }).to eql(my_hash.all? { |_key, value| value })
    end
    it 'Compares the result of my_all? enumerable after running through my_text to the original enumerable all?' do
      expect(my_text.my_all? { |word| word.length >= 3 }).to eql(my_text.all? { |word| word.length >= 3 })
    end
    it 'Compares the result of my_all? enumerable after running through my_text with (/t/) to the original enumerable all?' do
      expect(my_text.my_all?(/t/)).to eql(my_text.all?(/t/))
    end
    it 'Compares the output of my_select enumerable after running through my_array without a block given' do
      expect(my_array.my_all?.to_s).to eql(my_array.all?.to_s)
    end
    it 'Compares the output of my_select enumerable after running through my_range without a block given' do
      expect(my_range.my_all?.to_s).to eql(my_range.all?.to_s)
    end
    it 'Compares the output of my_select enumerable after running through my_hash without a block given' do
      expect(my_hash.my_all?.to_s).to eql(my_hash.all?.to_s)
    end
    it 'Compares the output of my_select enumerable after running through my_text without a block given' do
      expect(my_text.my_all?.to_s).to eql(my_text.all?.to_s)
    end
  end


  describe '#my_any?' do
    it ' Test my_array.my_any? { |value| value } to return the same as my_array.any? { |value| value }' do
      expect(my_array.my_any? { |value| value }).to eql(my_array.any? { |value| value })
    end
    it ' Test my_array.my_any?(Numeric) to return the same as my_array.any?(Numeric)' do
      expect(my_array.my_any?(Numeric)).to eql(my_array.any?(Numeric))
    end
    it ' Test my_range.my_any? { |value| value } to return the same as my_range.any? { |value| value }' do
      expect(my_range.my_any? { |value| value }).to eql(my_range.any? { |value| value })
    end
    it ' Test my_range.my_any?(Numeric) to return the same as my_range.any?(Numeric)' do
      expect(my_range.my_any?(Numeric)).to eql(my_range.any?(Numeric))
    end
    it ' Test my_hash.my_any? { |_key, value| value } to return the same as my_hash.any? { |_key, value| value }' do
      expect(my_hash.my_any? { |_key, value| value }).to eql(my_hash.any? { |_key, value| value })
    end
    it ' Test my_text.my_any? { |word| word.length >= 3 } to return the same as my_text.any? { |word| word.length >= 3 }' do
      expect(my_text.my_any? { |word| word.length >= 3 }).to eql(my_text.any? { |word| word.length >= 3 })
    end
    it ' Test my_text.my_any?(/t/) to return the same as my_text.any?(/t/)' do
      expect(my_text.my_any?(/t/)).to eql(my_text.any?(/t/))
    end
    it 'Compares array output without a block ' do
      expect(my_array.my_any?.to_s).to eql(my_array.my_any?.to_s)
    end
    it 'Compares array output without a block ' do
      expect(my_range.my_any?.to_s).to eql(my_range.my_any?.to_s)
    end
    it 'Compares array output without a block ' do
      expect(my_hash.my_any?.to_s).to eql(my_hash.my_any?.to_s)
    end
    it 'Compares array output without a block ' do
      expect(my_text.my_any?.to_s).to eql(my_text.my_any?.to_s)
    end
  end

  describe '#my_none?' do
    it ' Test my_array.my_none? { |value| value } to return the same as my_array.none? { |value| value }' do
      expect(my_array.my_none? { |value| value }).to eql(my_array.none? { |value| value })
    end
    it ' Test my_array.my_none?(Numeric) to return the same as my_array.none?(Numeric)' do
      expect(my_array.my_none?(Numeric)).to eql(my_array.none?(Numeric))
    end
    it ' Test my_range.my_none? { |value| value } to return the same as my_range.none? { |value| value }' do
      expect(my_range.my_none? { |value| value }).to eql(my_range.none? { |value| value })
    end
    it ' Test my_range.my_none?(Numeric) to return the same as my_range.none?(Numeric)' do
      expect(my_range.my_none?(Numeric)).to eql(my_range.none?(Numeric))
    end
    it ' Test my_hash.my_none? { |_key, value| value } to return the same as my_hash.none? { |_key, value| value }' do
      expect(my_hash.my_none? { |_key, value| value }).to eql(my_hash.none? { |_key, value| value })
    end
    it ' Test my_text.my_none? { |word| word.length >= 3 } to return the same as my_text.none? { |word| word.length >= 3 }' do
      expect(my_text.my_none? { |word| word.length >= 3 }).to eql(my_text.none? { |word| word.length >= 3 })
    end
    it ' Test my_text.my_none?(/t/) to return the same as my_text.none?(/t/)' do
      expect(my_text.my_none?(/t/)).to eql(my_text.none?(/t/))
    end
    it 'Compares array output without a block or argument ' do
      expect(my_array.my_none?.to_s).to eql(my_array.my_none?.to_s)
    end
    it 'Compares array output without a block or argument ' do
      expect(my_range.my_none?.to_s).to eql(my_range.my_none?.to_s)
    end
    it 'Compares array output without a block or argument ' do
      expect(my_hash.my_none?.to_s).to eql(my_hash.my_none?.to_s)
    end
    it 'Compares array output without a block or argument ' do
      expect(my_text.my_none?.to_s).to eql(my_text.my_none?.to_s)
    end
  end

  describe '#my_count' do
    it ' Test my_array.my_count{ |value| value } to return the same as my_array.count { |value| value }' do
      expect(my_array.my_count { |value| value }).to eql(my_array.count { |value| value })
    end
    it ' Test my_array.my_count(Numeric) to return the same as my_array.count(Numeric)' do
      expect(my_array.my_count(Numeric)).to eql(my_array.count(Numeric))
    end
    it ' Test my_range.my_count{ |value| value } to return the same as my_range.count { |value| value }' do
      expect(my_range.my_count { |value| value }).to eql(my_range.count { |value| value })
    end
    it ' Test my_range.my_count(Numeric) to return the same as my_range.count(Numeric)' do
      expect(my_range.my_count(Numeric)).to eql(my_range.count(Numeric))
    end
    it ' Test my_hash.my_count{ |_key, value| value } to return the same as my_hash.count { |_key, value| value }' do
      expect(my_hash.my_count { |_key, value| value }).to eql(my_hash.count { |_key, value| value })
    end
    it ' Test my_text.my_count{ |word| word.length >= 3 } to return the same as my_text.count { |word| word.length >= 3 }' do
      expect(my_text.my_count { |word| word.length >= 3 }).to eql(my_text.count { |word| word.length >= 3 })
    end
    it ' Test my_text.my_count(/t/) to return the same as my_text.count(/t/)' do
      expect(my_text.my_count(/t/)).to eql(my_text.count(/t/))
    end
    it ' Compares the output when being used on an array without any arguments or blocks ' do
      expect(my_array.my_count).to eql(my_array.count)
    end
    it ' Compares the output when being used on a range without any arguments or blocks ' do
      expect(my_range.my_count).to eql(my_range.count)
    end
    it ' Compares the output when being used on a hash without any arguments or blocks ' do
      expect(my_hash.my_count).to eql(my_hash.count)
    end
    it ' Compares the output when being used on an array of strings without any arguments or blocks ' do
      expect(my_text.my_count).to eql(my_text.count)
    end
  end

  describe '#my_map' do
    it ' Test my_array.my_map{ |value| value } to return the same as my_array.map { |value| value }' do
      expect(my_array.my_map { |value| value }).to eql(my_array.map { |value| value })
    end
    it ' Test my_range.my_map{ |value| value } to return the same as my_range.map { |value| value }' do
      expect(my_range.my_map { |value| value }).to eql(my_range.map { |value| value })
    end
    it ' Test my_hash.my_map{ |_key, value| value } to return the same as my_hash.map { |_key, value| value }' do
      expect(my_hash.my_map { |_key, value| value }).to eql(my_hash.map { |_key, value| value })
    end
    it ' Test my_text.my_map{ |word| word.length >= 3 } to return the same as my_text.map { |word| word.length >= 3 ' do
      expect(my_text.my_map { |word| word.length >= 3 }).to eql(my_text.map { |word| word.length >= 3 })
    end
    it ' Compares the output when being used on an array without any blocks or arguments' do
      expect(my_array.my_map.to_a).to eql(my_array.map.to_a)
    end
    it ' Compares the output when being used on a a range without any blocks or arguments' do
      expect(my_range.my_map.to_a).to eql(my_range.map.to_a)
    end
    it ' Compares the output when being used on a a hash without any blocks or arguments' do
      expect(my_hash.my_map.to_a).to eql(my_hash.map.to_a)
    end
    it ' Compares the output when being used on an array of text without any blocks or arguments' do
      expect(my_text.my_map.to_a).to eql(my_text.map.to_a)
    end
  end

  describe '#my_inject' do
    it ' Test (my_array.my_inject{ |value| value } to return the same as my_array.inject { |value| value }' do
      expect(my_array.my_inject { |value| value }).to eql(my_array.inject { |value| value })
    end
    it ' Test my_range.my_inject{ |value| value } to return the same as my_range.inject { |value| value }' do
      expect(my_range.my_inject { |value| value }).to eql(my_range.inject { |value| value })
    end
    it ' Test my_hash.my_inject{ |_key, value| value } to return the same as my_hash.inject { |_key, value| value }' do
      expect(my_hash.my_inject { |_key, value| value }).to eql(my_hash.inject { |_key, value| value })
    end
    it ' Raises LocalJumpError when no block is given' do
      expect { my_array.my_inject }.to raise_error(LocalJumpError)
    end
  end
end

# rubocop:enable Layout/LineLength
