class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer    :visiter_id, null: false
      t.integer    :visited_id, null: false
      t.integer    :note_id
      t.references :comment , foreign_key: true , null: false
      t.string     :action, default: '', null: false
      t.boolean    :checked, default: false, null: false
      t.timestamps
    end
  end
end
