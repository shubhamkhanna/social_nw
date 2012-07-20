class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :creator_id
      t.string :location
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
