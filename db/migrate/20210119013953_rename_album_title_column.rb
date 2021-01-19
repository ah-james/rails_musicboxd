class RenameAlbumTitleColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :albums, :album_title, :title
  end
end
