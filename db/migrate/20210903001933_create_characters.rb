class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :species
      t.string :gender
      t.string :house
      t.string :date_of_birth
      t.integer :year_of_birth
      t.string :ancestry
      t.string :eye_colour
      t.string :hair_colour
      t.string :wand
      t.string :patronus
      t.boolean :hogwarts_student
      t.boolean :hogwarts_staff
      t.string :actor
      t.boolean :alive
      t.string :image

      t.timestamps
    end
  end
end
