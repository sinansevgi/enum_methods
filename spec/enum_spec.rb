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
  end
end
