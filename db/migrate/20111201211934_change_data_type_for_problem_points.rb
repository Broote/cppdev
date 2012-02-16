class ChangeDataTypeForProblemPoints < ActiveRecord::Migration
  def self.up
    change_table :problems do |t|
      t.change :points, :float
    end
  end

  def self.down
    change_table :problems do |t|
      t.change :points, :integer
    end
  end
end