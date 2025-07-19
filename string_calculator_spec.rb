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

      it 'handles multiple trailing commas and newline delimiters' do
        expect(described_class.add("1,2,3,,,")).to eq(6)
        expect(described_class.add("1\n2\n3\n\n\n")).to eq(6)
      end
    end

    context 'with custom delimiter' do
      it 'uses a custom delimiter when specified' do
        expect(described_class.add("//;\n1;2;3")).to eq(6)
      end

      it 'works with any multiple-character custom delimiter' do
        expect(described_class.add("//#!\n4#!5#!6")).to eq(15)
      end

      it 'works in conjunction with existing delimiters' do
        expect(described_class.add("//;\n1;2,3\n4")).to eq(10)
      end

      it 'returns 0 when there are no numbers and no delimiters' do
         expect(described_class.add("//;\n")).to eq(0)
      end

      it 'returns 0 when there are no numbers but has multiple delimiters' do
         expect(described_class.add("//;\n;;;")).to eq(0)
      end

      it 'fallsback to predefined delimiters if custom delimiter is not specified' do
        expect(described_class.add("//\n1,2,3")).to eq(6)
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
      it 'returns 0 when there are no numbers after the custom delimiter' do
        expect(described_class.add("//;\n")).to eq(0)
      end

      it 'ignores whitespace-only input' do
        expect(described_class.add(" \n ")).to eq(0)
      end

      it 'handles single number input' do
        expect(described_class.add("42")).to eq(42)
      end
    end
  end
end