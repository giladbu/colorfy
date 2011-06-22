class Board < ActiveRecord::Base
  has_many :cells, :order => [:x, :y]
  validates_numericality_of :size, {:greater_than_or_equal_to => 0}

  after_create :create_cells

  def move(color)
    self.step= self.step + 1
    queue = [cells.first]
    while queue.present? do
      cell = queue.shift
      cell.neighbors { |neighbor| queue<< neighbor }
      cell.update_attribute(:color, color)
    end
    self if self.save
  end

  private

  def create_cells
    self.size.times do |x|
      self.size.times do |y|
        color = rand Cell::COLORS.size
        c = Cell.create! :x => x, :y => y, :color => color, :board => self
      end
    end
  end
end
