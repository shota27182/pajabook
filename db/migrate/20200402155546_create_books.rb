class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :place
      t.integer :field
      t.string :image_name
      t.integer :user_id

      t.timestamps
    end
  end
end
