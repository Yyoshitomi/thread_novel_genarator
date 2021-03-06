class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name,           null: false
      t.text :honbun,           null: false
      t.integer :number,        null: false
      t.string :date,           default: false
      t.boolean :generate_date, default: true
      t.boolean :on_id,         null:false, default: false
      t.string :ch_id
      t.boolean :generate_id
      t.references :topic,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
