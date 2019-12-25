class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.string :time
      t.string :event_date
      t.string :description
      
      t.timestamps
    end
  end
end
