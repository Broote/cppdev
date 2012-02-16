class ChangeColumnPointsUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :points, :integer, :default => 0, :null => false
    end
  end

  def self.down
    change_table :users do |t|
      t.change :points, :integer
    end
  end
end
