class Cell < ActiveRecord::Base
  COLORS = [:red, :blue, :green, :yellow]
  belongs_to :board
end
