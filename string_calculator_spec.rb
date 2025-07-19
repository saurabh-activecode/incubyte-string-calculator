require_relative 'string_calculator'
require 'rspec'

RSpec.describe StringCalculator do
  describe '.add' do

    context "when the input is empty" do
      it "returns 0" do
        expect(described_class.add("")).to eq(0)
        expect(described_class.add("   ")).to eq(0)
      end
    end

    context 'with default delimiters' do
      it 'returns the sum of comma-separated numbers' do
        expect(described_class.add("1,2,3")).to eq(6)
      end

      it 'returns the sum of numbers separated by newlines' do
        expect(described_class.add("1\n2\n3")).to eq(6)
      end
    end

    context 'with custom delimiter' do
    end

    context 'with negative numbers' do
    end

    context 'edge cases' do
    end
  end
end