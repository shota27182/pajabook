class AddImgToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :img, :string
  end
end
