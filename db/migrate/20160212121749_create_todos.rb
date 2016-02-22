class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
