require 'spec_helper'

describe Cell do
  it "finds no neighbors if there are none" do
    board = Factory :board, :size => 1
    neighbors = []
    board.cells.first.neighbors {|n| neighbors<< n}
    neighbors.should be_empty

    board = Factory :board, :size => 2
    cell = board.cells.first

    cell.update_attribute(:color, Cell.color_index(:red))

    board.cells.each do |c|
      c.update_attribute(:color, Cell.color_index(:blue)) if c != cell
    end

    neighbors = []
    cell.neighbors {|n| neighbors<< n}
    neighbors.should be_empty
  end

  it "finds its neighbors" do
    board = Factory :board, :size => 3
    cell = board.cells.first
    cell.update_attribute(:color, Cell.color_index(:red))

    [[1,0], [0,1]].each do |x , y|
      c = board.cells.find_by_x_and_y(x, y)
      c.update_attribute(:color, Cell.color_index(:red))
    end

    neighbors = []
    cell.neighbors {|n| neighbors<< n}
    neighbors.size == 2
  end
end
