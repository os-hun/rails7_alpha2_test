class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :email, null: false
      t.string :password_digest, null: false
      t.string :username, null: false

      t.timestamps
    end
  end
end
