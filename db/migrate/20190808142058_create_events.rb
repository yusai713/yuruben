class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :contents
      t.integer :user_id
      t.timestamps
    end
  end
end
