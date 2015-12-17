class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.string :first_name
      t.string :last_name
      t.string :img_url
      t.string :bio

    end
  end
end
