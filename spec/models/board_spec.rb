require 'spec_helper'

describe Board do
  before do
    @board =  Factory :board
  end
  
  it "should have size x size cells" do
    @board.cells.count.should == @board.size ** 2
  end
end
