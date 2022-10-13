class AddUserIdToAlbum < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :user_id, :int
  end
end
