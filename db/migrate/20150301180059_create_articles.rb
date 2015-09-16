class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false, limit: 20, comment: '文章标题'
      t.text :content, null: true, comment: '文章内容'
      t.integer :category_id, null: false, comment: '文章类别'
      t.integer :user_id, null:false, comment: '作者id'

      t.timestamps null: false
    end

    add_index :articles, [:user_id, :category_id]
  end
end
