class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
