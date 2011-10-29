class AddPointsToSolution < ActiveRecord::Migration
  def self.up
    add_column :solutions, :points, :integer
  end

  def self.down
    remove_column :solutions, :points
  end
end
