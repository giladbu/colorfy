class BoardsController < ApplicationController
  # GET /boards/1
  def show
    @board = Board.find(params[:id])
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # POST /boards
  def create
    @board = Board.new(params[:board])
    if @board.save
      redirect_to(@board, :notice => 'Board was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /boards/1
  # PUT /boards/1.js
  def update
    @board = Board.find(params[:id])
    @board = @board.move(params[:color])
    respond_to do |format|
      format.html { redirect_to(@board) }
      format.js {}
    end
  end
end
