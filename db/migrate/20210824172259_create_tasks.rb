class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :status, default: 0
      t.datetime :finished_at
      t.datetime :deadline

      t.timestamps
    end
  end
end
