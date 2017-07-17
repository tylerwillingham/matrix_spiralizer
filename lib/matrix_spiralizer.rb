class MatrixSpiralizer
  def self.read(matrix)
    results = []

    # just get the first array of arrays
    top_row_handler = -> { matrix.shift }
    # pull off the last records for each row
    right_column_handler = -> { matrix.map(&:pop) }
    # pop off the last row and reverse it
    bottom_row_handler = -> { matrix.pop.reverse }
    # pull off the left col vals & retrun them bottom-up
    left_column_handler = -> { matrix.map(&:shift).reverse }

    ordered_handlers = [top_row_handler, right_column_handler, bottom_row_handler, left_column_handler].cycle

    results.concat ordered_handlers.next.call() until matrix.empty?

    results.join(' ').downcase
  end
end
