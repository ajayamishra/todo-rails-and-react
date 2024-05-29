class TaggedTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tagged_tasks, id: false do |t|
      t.column :id, 'varchar(26)', null: false, primary_key: true
      t.bigint :partition_key, null: false, auto_increment: true, index: true, limit: 20, comment: 'Sequential number for analysis'

      t.references :user, type: 'varchar(26)', foreign_key: true
      t.references :task, type: 'varchar(26)', foreign_key: true
      t.references :tag, type: 'varchar(26)', foreign_key: true

      t.timestamps
    end
  end
end
