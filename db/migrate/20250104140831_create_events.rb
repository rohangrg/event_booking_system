class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :location
      t.datetime :event_start_time
      t.integer :total_tickets
      t.integer :available_tickets

      t.timestamps
    end
  end
end
