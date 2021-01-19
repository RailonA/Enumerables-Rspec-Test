require_relative '../my_enumerables.rb'

describe Enumerable do 
let(:my_array){[1, 2, 3, 4, 5]}
let(:my_hash){ { x: 1, y: 2, z: 3 }}
let(:my_text){ %w[ant bear cat]}
let(:arg){ proc { |value| value * 2 }}
let(:my_range){(1..9)}

describe '#my_each' do 
 it "Test .my_each to return the same as .each" do
    expect(my_array.my_each(&:even?)).to eq(my_array.each(&:even?))
    expect(my_range.my_each(&:even?)).to eql(my_range.each(&:even?))
    expect(my_hash.my_each{ |value|  value }).to eql(my_hash.each{ |value|  value })
end 
end

describe '#my_each_with_index' do 
    it ' Test .my_each_with_index to return the same as .each_with_index' do 
        expect(my_array.my_each_with_index{ |value|  value }).to eq(my_array.each_with_index{ |value|  value })
    expect(my_range.my_each_with_index{ |value|  value }).to eql(my_range.each_with_index{ |value|  value })
    expect(my_hash.my_each_with_index{ |value|  value }).to eql(my_hash.each_with_index{ |value|  value })
    end
end
 
end


