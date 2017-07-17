require 'spec_helper'

describe MatrixSpiralizer do
  describe '.reorder' do
    it 'does not return the input as the output' do
      input = [
        ['A','B','C','D'],
        ['J','K','L','E'],
        ['I','H','G','F']
      ]

      result = MatrixSpiralizer.read(input)

      expect(result).not_to equal(input)
    end

    it 'returns a downcased string' do
      input = [['A','B'], ['D','C']]

      result = MatrixSpiralizer.read(input)

      expect(result.downcase).to eq(result)
    end

    it 'returns a string' do
      input = [
        ['A','B','C','D'],
        ['J','K','L','E'],
        ['I','H','G','F']
      ]

      result = MatrixSpiralizer.read(input)

      expect(result).to eq('a b c d e f g h i j k l')
    end
  end
end
