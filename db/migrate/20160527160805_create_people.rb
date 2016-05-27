class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, :limit => 254
      t.text :job
      t.string :gender
      t.date :birthdate
      t.string :picture
      
      t.timestamps null: false
    end
  end
end
