class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.string :name
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
    add_index :attendees, [:attended_event_id]
  end
end
