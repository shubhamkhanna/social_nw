class CreateLikes <ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :like_id
      t.string :like_type
      t.timestamps
    end
  end
end
 