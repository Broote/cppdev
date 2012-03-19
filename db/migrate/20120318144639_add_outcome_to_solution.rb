class AddOutcomeToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :outcome, :text

  end
end
