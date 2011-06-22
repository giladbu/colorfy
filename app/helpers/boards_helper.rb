module BoardsHelper
  def cell_class(board, cell)
    width = 16 / board.size
    klass = [ "span-#{width}" ]
    klass<< 'top' if cell.x == 0
    klass<< 'left' if cell.y == 0
    klass<< 'bottom' if cell.x == (board.size - 1)
    klass<< 'last' if cell.y == (board.size - 1)
    klass<< Cell::COLORS[cell.color].to_s
    klass.join " "
  end
end
