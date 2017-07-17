class MatrixSpiralizer
  attr_accessor :matrix, :results

  def initialize(matrix)
    self.matrix = matrix
    self.results = []
  end

  def read
    results.concat handler_cycle.next.call until matrix.empty?

    results.join(' ').downcase
  end

  private

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
