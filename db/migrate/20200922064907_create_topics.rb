class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :default_name
      t.boolean :time_display
      t.string :start_date

      t.timestamps
    end
  end
end
