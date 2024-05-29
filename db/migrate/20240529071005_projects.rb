class Projects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects, id: false do |t|
      t.column :id, 'varchar(26)', null: false, primary_key: true
      t.bigint :partition_key, null: false, auto_increment: true, index: true, limit: 20, comment: 'Sequential number for analysis'
      t.string :name, null: false, limit: 255
      t.integer :color, null: false, limit: 2, default: 0 # ENUM  0 = red, 1 = green, 2 = blue and so ON will be defined in the Model later
      t.integer :view_style, null: false, limit: 1, default: 0 # ENUM  0 = grid, 1 = list
      t.boolean :is_shared, null: false, default: false
      t.boolean :is_favorite, null: false, default: false
      t.boolean :is_archived, null: false, default: false
      t.integer :order, null: false, limit: 4 # ORDER to show in the UI
      t.string :description, limit: 255
      t.references :user, type: 'varchar(26)', foreign_key: true

      t.timestamps
    end

    add_index :projects, :order, unique: true
  end
end
