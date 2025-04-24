# frozen_string_literal: true

require 'string_calculator'

describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end
    it 'returns number for single number string' do
      expect(StringCalculator.add('2')).to eq(2)
    end
    it 'returns the sum of two numbers' do
      expect(StringCalculator.add('1,2')).to eq(3)
    end
    it 'returns the sum of six numbers' do
      expect(StringCalculator.add('1,2,3,4,5,6')).to eq(21)
    end
    it 'supports newline as a delimiter' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
      expect(StringCalculator.add("//;\n3;4")).to eq(7)
    end

    it 'raises error on negative numbers with list' do
      expect { StringCalculator.add('1, 2, -3, 4, -5') }
        .to raise_error('negative numbers not allowed: -3, -5')
    end
  end
end
