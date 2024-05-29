class Tasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks, id: false do |t|
      t.column :id, 'varchar(26)', null: false, primary_key: true
      t.bigint :partition_key, null: false, auto_increment: true, index: true, limit: 20, comment: 'Sequential number for analysis'
      t.string :name, null: false, limit: 255
      t.integer :priority, null: false, limit: 1, default: 1 # ENUM  0 = Low, 1 = Medium, 2 = High
      t.datetime :due_date, comment: 'Due Date' # NULLABLE
      t.integer :status, null: false, limit: 1, default: 0 # ENUM  0 = Not Started, 1 = In Progress, 2 = Completed
      t.string :description, limit: 255
      t.references :user, type: 'varchar(26)', foreign_key: true
      t.references :project, type: 'varchar(26)', foreign_key: true

      t.timestamps
    end
  end
end
