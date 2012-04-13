class AddAccountNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :account_number, :string

  end
end
