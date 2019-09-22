class AddColumnToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :project_id, :integer
  end
end
