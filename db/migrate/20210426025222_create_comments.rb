class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :note,foreign_key: true
      t.references :user,foreign_key: true
      t.integer :other_user_id
      t.timestamps
    end
  end
end
