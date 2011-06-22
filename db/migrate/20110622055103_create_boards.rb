class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
      t.integer :step, :default => 0
      t.integer :size

      t.timestamps
    end
  end

  def self.down
    drop_table :boards
  end
end
