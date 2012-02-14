class AddDeadlineToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :deadline, :date

  end
end
