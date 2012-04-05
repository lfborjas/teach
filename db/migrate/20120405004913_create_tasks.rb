class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.integer :challenge_id
      t.boolean :do_eval
      t.text :expected_result
      t.integer :ordering

      t.timestamps
    end
  end
end
