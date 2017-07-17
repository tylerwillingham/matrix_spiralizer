require 'spec_helper'

describe MatrixSpiralizer do
  describe '#read' do
    it 'returns a downcased string' do
      input = [['A','B'], ['D','C']]

      result = MatrixSpiralizer.new(input).read

      expect(result.downcase).to eq(result)
    end

    it 'returns a string' do
      input = [
        ['A','B','C','D'],
        ['J','K','L','E'],
        ['I','H','G','F']
      ]

      result = MatrixSpiralizer.new(input).read

      expect(result).to eq('a b c d e f g h i j k l')
    end
  end
end
