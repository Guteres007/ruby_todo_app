class CreateBoardItems < ActiveRecord::Migration[6.0]
  def change
    create_table :board_items do |t|
      t.integer :board_id
      t.text :description

      t.timestamps
    end
  end
end
