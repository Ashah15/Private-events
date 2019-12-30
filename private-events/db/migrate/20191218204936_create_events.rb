class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.string :time
      t.datetime :event_date
      t.string :description
      t.integer :creator_id, null:false

      t.timestamps
    end
    add_index :events, [:creator_id, :created_at]
  end
end

