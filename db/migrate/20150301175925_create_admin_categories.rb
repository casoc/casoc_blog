class CreateAdminCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 20, comment: '分类名称'
      t.integer :user_id, null: false, default: 0, comment: '创建人id'

      t.timestamps null: false
    end

    add_index :categories, [:user_id, :name], unique: true
  end
end
