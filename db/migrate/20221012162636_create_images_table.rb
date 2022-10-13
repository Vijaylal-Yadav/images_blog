class CreateImagesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :tag_line
      t.timestamps
    end
  end
end
