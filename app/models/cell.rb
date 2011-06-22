class Cell < ActiveRecord::Base
  COLORS = [:red, :blue, :green, :yellow]
  belongs_to :board

  def self.color_index(sym)
    COLORS.index(sym)
  end

  def neighbors
    #look on your bottom, right, top, left
    [[1,0], [0,1], [-1,0], [0, -1]].each do |up_down, left_right|
      i = self.x+up_down; j = self.y+left_right

      if i >= 0 && j >= 0 && i < board.size && j < board.size
        cell = board.cells.find_by_x_and_y(i, j)
        if cell && cell.color == self.color
          yield cell
        end
      end
    end
  end
end
