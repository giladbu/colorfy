class Board < ActiveRecord::Base
  has_many :cells, :order => [:x, :y]
  validates_numericality_of :size,
    {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 16}

  after_create :create_cells

  def done?
    Cell.group(:color).where(:board_id => self.id).count.size == 1
  end

  def move(color)
    if color.is_a?(String) || color.is_a?(Symbol)
      color = Cell.color_index(color.to_sym)
    end
    self.step= self.step + 1
    queue = [cells.first]
    visited = []
    while queue.present? do
      cell = queue.shift
      cell.neighbors do |neighbor|
        unless visited.index(neighbor.id)
          queue<< neighbor
          visited<< neighbor.id
        end
      end
      cell.update_attribute(:color, color)
    end
    self.save
    self.reload
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
