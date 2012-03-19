class AddPointsgotToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :points_got, :integer

  end
end
