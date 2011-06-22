require 'spec_helper'

describe Board do
  context "creates correctly" do
    before do
      @board =  Factory :board
    end
  
    it "should have size x size cells" do
      @board.cells.count.should == @board.size ** 2
    end
  end

  context "when make a move" do
    before do
      @board = Factory :board, :size => 3
      [[0,0,:red], [0,1,:red], [0,2,:red],
       [1,0,:blue], [1,1,:blue], [1,2,:red], 
       [2,0,:blue], [2,1,:red], [2,2,:red]].each do |x, y, color|
        cell = @board.cells.find_by_x_and_y(x, y)
        cell.update_attribute(:color, Cell.color_index(color))
      end
      @board.reload
    end

    it "update board correctly" do
      green = Cell.color_index(:green)
      @board.move(green)

      [[0,0,:green], [0,1,:green], [0,2,:green],
       [1,0,:blue], [1,1,:blue], [1,2,:green], 
       [2,0,:blue], [2,1,:green], [2,2,:green]].each do |x, y, color|
        cell = @board.cells.find_by_x_and_y(x, y)
        cell.color.should == Cell.color_index(color)
      end
    end
  end
end
