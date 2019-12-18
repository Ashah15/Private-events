class AddUserToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, null: true, foreign_key: true
  end
end
