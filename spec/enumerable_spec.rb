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

    # my_select
    describe '#my_select' do
        it 'my_select should return odd array' do
            expect(array.my_select{|x| x%2 == 0}).to eq(array.select{|x| x%2 == 0})
        end
    end

    # my_select
    describe '#my_select' do
        it 'my_select should return odd array' do
            expect(array.my_select{|x| x%2 == 0}).to eq(array.select{|x| x%2 == 0})
        end
    end

    # my_select
    describe '#my_select' do
        it 'my_select should return odd array' do
            expect(array.my_select{|x| x%2 == 0}).to eq(array.select{|x| x%2 == 0})
        end
    end


    # my_select
    describe '#my_select' do
        it 'my_select should return odd array' do
            expect(array.my_select{|x| x%2 == 0}).to eq(array.select{|x| x%2 == 0})
        end
    end


    
end