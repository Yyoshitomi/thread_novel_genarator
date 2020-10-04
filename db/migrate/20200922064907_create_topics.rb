class CreateTopics < ActiveRecord::Migration[6.0]

  require 'date'

  def change
    create_table :topics do |t|
      t.string :title,         null: false, default: ''
      t.string :default_name,  null: false, default: '名無しさん'
      t.boolean :time_display, null:false, default: false

      t.timestamps
    end
  end
end
