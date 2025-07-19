require_relative 'string_calculator'
require 'rspec'

RSpec.describe StringCalculator do
  describe '.add' do

    context "when the input is empty" do
      it "returns 0" do
        expect(described_class.add("")).to eq(0)
        expect(described_class.add("   ")).to eq(0)
      end

      it 'handles multiple commas without numbers' do
        expect(described_class.add(",,,,,,")).to eq(0)
      end

      it 'handles multiple newlines without numbers' do
        expect(described_class.add("\n\n\n\n")).to eq(0)
      end

      it 'handles multiple commas and newlines without numbers' do
        expect(described_class.add("\n\n\n\n,,,,")).to eq(0)
      end
    end

    context 'with default delimiters' do
      it 'returns the sum of comma-separated numbers' do
        expect(described_class.add("1,2,3")).to eq(6)
      end

      it 'returns the sum of numbers separated by newlines' do
        expect(described_class.add("1\n2\n3")).to eq(6)
      end

      it 'handles mixed comma and newline delimiters' do
        expect(described_class.add("1\n2,3")).to eq(6)
      end
    end

    context 'with custom delimiter' do
      it 'uses a custom delimiter when specified' do
        expect(described_class.add("//;\n1;2;3")).to eq(6)
      end


    end

    context 'with negative numbers' do
      it 'raises an error listing all the negative numbers' do
        expect {
          described_class.add("1,-2,3,-4")
        }.to raise_error("negative numbers not allowed: -2,-4")
      end

      it 'raises an error listing all the negative numbers with mixed delimiters' do
        expect {
          described_class.add("1,-2,3\n-4")
        }.to raise_error("negative numbers not allowed: -2,-4")
      end

      it 'raises an error listing all the negative numbers with custom delimiter' do
        expect {
          described_class.add("//;\n1;-2;3;-4")
        }.to raise_error("negative numbers not allowed: -2,-4")
      end

      it 'does not raise error if all numbers are non-negative' do
        expect(described_class.add("1,2,3")).to eq(6)
      end
    end

    context 'edge cases' do
    end
  end
end