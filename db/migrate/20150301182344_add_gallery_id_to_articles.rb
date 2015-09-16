class AddGalleryIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :gallery_id, :integer
  end
end
