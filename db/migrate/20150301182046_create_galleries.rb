class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :image, null: false, comment: '图片地址'
      t.string :title, null: false, comment: '图片标题'
      t.string :alt, null: true, comment: '图片alt内容'
      t.string :user_id, null: true, comment: '用户ID'

      t.timestamps null: false
    end
  end
end
