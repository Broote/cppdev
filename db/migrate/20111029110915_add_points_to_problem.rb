class AddPointsToProblem < ActiveRecord::Migration
  def self.up
    add_column :problems, :points, :integer
  end

  def self.down
    remove_column :problems, :points
  end
end
