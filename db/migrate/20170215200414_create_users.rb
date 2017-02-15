class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps null: false
      t.index :user_name, unique: true
      t.index :session_token, unique: true
      t.index :password_digest
    end
  end
end
