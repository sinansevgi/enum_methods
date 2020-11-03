require 'simplecov'

SimpleCov.start
require_relative '../my_methods.rb'

RSpec.describe Enumerable do
  describe '#Enumerable' do
    let(:arr1) { [1, 2, 3, 4, 6] }
    let(:range1) { (0...9) }
    let(:hash1) { { 'name' => 'eric', 'age' => 23 } }

    describe '#my_each' do
      it 'should go through all elements and return the original array' do
        expect(arr1.my_each { |n| n }).to eql(arr1.each { |i| i })
        expect(range1.my_each { |n| n }).to eql(range1.each { |i| i })
        expect(hash1.my_each { |n| n }).to eql(hash1.each { |i| i })
      end
    end

    describe '#my_each_with_index' do
      it 'should go through all elements and return the original array with values and index' do
        expect(arr1.my_each_with_index { |n| n }).to eql(arr1.each { |i| i })
        expect(range1.my_each_with_index { |n| n }).to eql(range1.each_with_index { |i| i })
        expect(hash1.my_each_with_index { |n| n }).to eql(hash1.each_with_index { |i| i })
      end
    end

    describe '#my_select' do
      it 'return an array of even numbers' do
        expect(arr1.my_select { |n| n.even? }).to eql(arr1.select { |i| i.even? })
      end
    end
  end
end
