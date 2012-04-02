class RemoveColumnFromSolutions < ActiveRecord::Migration
  def up
    remove_column :solutions, :verified
      end

  def down
    add_column :solutions, :verified, :boolean
  end
end
