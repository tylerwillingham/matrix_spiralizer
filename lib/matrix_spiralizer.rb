class MatrixSpiralizer
  class InvalidInputError < StandardError; end
  class InconsistentLengthError < StandardError; end

  VALID_CHARACTER_REGEX = /[A-Z]/

  attr_accessor :matrix, :results

  def initialize(matrix)
    self.matrix = matrix
    self.results = []
  end

  def read
    validate_matrix

    results.concat handler_cycle.next.call until matrix.empty?

    results.join(' ').downcase
  end

  def validate_matrix
    validate_length_consistency
    validate_characters
  end

  private

  def validate_length_consistency
    first_row_length = matrix.first.size
    return true if matrix.drop(1).all? { |row| row.size == first_row_length }

    raise InconsistentLengthError, 'All inner arrays must be of the same length'
  end

  def validate_characters
    return true if matrix.flatten.all? { |char| char =~ VALID_CHARACTER_REGEX }

    raise InvalidInputError, 'The matrix input can only contain uppercase letters'
  end

  def handler_cycle
    @_handler_cycle ||= ordered_handlers.cycle
  end

  def ordered_handlers
    [
      top_row_handler,
      right_column_handler,
      bottom_row_handler,
      left_column_handler
    ]
  end

  # just get the first array of arrays
  def top_row_handler
    -> { matrix.shift }
  end

  # pull off the last records for each row
  def right_column_handler
    -> { matrix.map(&:pop) }
  end

  # pop off the last row and reverse it
  def bottom_row_handler
    -> { matrix.pop.reverse }
  end

  # pull off the left col vals & retrun them bottom-up
  def left_column_handler
    -> { matrix.map(&:shift).reverse }
  end
end
