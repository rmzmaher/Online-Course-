class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :date_of_birth
      t.integer :gender
      t.string :prof_pic
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
