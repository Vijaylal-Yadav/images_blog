class AddAlbumIdToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :album_id, :int
  end
end
