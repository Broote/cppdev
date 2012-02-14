class AddResultToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :result, :string

  end
end
