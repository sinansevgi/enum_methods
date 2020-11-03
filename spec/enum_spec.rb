require 'simplecov'

SimpleCov.start
require_relative '../my_methods.rb'

RSpec.describe Enumerable do
  describe '#Enumerable' do
    let(:arr1) { [1, 2, 3, 4, 6] }
    let(:range1) { (0...9) }
    let(:hash1) { { 'name' => 'eric', 'age' => 23 } }

    describe '#my_each' do
      it 'should go through all elements in the array' do
        result1 = []
        result2 = []
        arr1.my_each { |n| result1 << n }
        arr1.each { |n| result2 << n }
        expect(result1).to eql(result2)
      end
    end

    describe '#my_each_with_index' do
      it 'should go through all elements and their index in the array' do
        result1 = []
        result2 = []
        arr1.my_each_with_index { |n, index| result1 << { 'value' => n, 'index' => index } }
        arr1.each_with_index { |n, index| result2 << { 'value' => n, 'index' => index } }
        expect(result1).to eql(result2)
      end
    end

    describe '#my_select' do
      it 'return an array of even numbers' do
        expect(arr1.my_select(&:even?)).to eql([2, 4, 6])
      end
      it 'return an array of odd numbers' do
        expect(arr1.my_select(&:odd?)).to eql([1, 3])
      end
    end

    describe '#my_all' do
      it 'return false if array is empty' do
        expect([].my_all?).to eq(true)
      end
      it 'return true or false if noblock given and no parameters' do
        expect(arr1.my_all?).to eq(true)
        expect([2, false, 3].my_all?).to eq(false)
      end

      it 'return true or false if parameter is passed and no block given' do
        expect(arr1.my_all?(5)).to eq(false)
        expect([3, 3, 3].my_all?(3)).to eq(true)
        expect([3, 3, 3].my_all?(Integer)).to eq(true)
        expect([3, 3.4, 3].my_all?(Integer)).to eq(false)
        expect(%w[eric david].my_all?(/o/)).to eq(false)
        expect(%w[eric david].my_all?(/i/)).to eq(true)
      end

      it 'return true or false if block is given' do
        expect(arr1.my_all? { |n| n > 5 }).to eq(false)
        expect(arr1.my_all? { |n| n > 0 }).to eq(true)
      end
    end
  end
end
