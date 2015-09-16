class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id, null: false, comment: '文章id'
      t.string :email, null: false, limit: 20, comment: '评论人email'
      t.string :subject, null: false, limit: 20, comment: '评论标题'
      t.text :message, null: false, comment: '评论内容'

      t.timestamps null: false
    end

    add_index :comments, :article_id
  end
end
