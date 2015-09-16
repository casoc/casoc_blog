class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false, comment: '用户名'
      t.string :email, null: false, comment: '邮箱'
      t.integer :admin, null: false, default: 0, limit: 1, comment: '是否是管理员'

      t.timestamps null: false
    end
  end
end
