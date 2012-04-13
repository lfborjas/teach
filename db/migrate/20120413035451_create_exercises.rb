class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :contents
      t.integer :student_id

      t.timestamps
    end
  end
end
