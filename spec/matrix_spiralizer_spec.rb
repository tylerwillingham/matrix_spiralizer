require 'spec_helper'

describe MatrixSpiralizer do
  describe '#read' do
    it 'returns a downcased string' do
      input = [%w(A B), %w(D C)]

      result = MatrixSpiralizer.new(input).read

      expect(result.downcase).to eq(result)
    end

    it 'returns a string' do
      input = [
        %w(A B C D),
        %w(J K L E),
        %w(I H G F)
      ]

      result = MatrixSpiralizer.new(input).read

      expect(result).to eq('a b c d e f g h i j k l')
    end
  end

  describe '#validate_matrix' do
    subject { spiralizer.validate_matrix }

    context 'given an input with varying inner-array lengths' do
      let(:spiralizer) do
        MatrixSpiralizer.new([
          %w(A B C),
          %w(D E F G),
          %w(H I J)
        ])
      end

      it 'raises an exception' do
        expect { subject }.to raise_error(MatrixSpiralizer::InconsistentLengthError)
      end
    end

    context 'given an input that contains lowercase characters' do
      let(:spiralizer) { MatrixSpiralizer.new([%w(A B), %w(D c)]) }

      it 'raises an exception' do
        expect { subject }.to raise_error(MatrixSpiralizer::InvalidInputError)
      end
    end

    context 'given an input that contains numeric characters' do
      let(:spiralizer) { MatrixSpiralizer.new([['A', 'B'], ['C', 4]]) }

      it 'raises an exception' do
        expect { subject }.to raise_error(MatrixSpiralizer::InvalidInputError)
      end
    end

    context 'given an input that contains special characters' do
      let(:spiralizer) { MatrixSpiralizer.new([['!', 'B'], ['C', 'D']]) }

      it 'raises an exception' do
        expect { subject }.to raise_error(MatrixSpiralizer::InvalidInputError)
      end
    end
  end
end
