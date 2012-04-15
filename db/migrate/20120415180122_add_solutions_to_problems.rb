class AddSolutionsToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :show_solution, :boolean, null: false, default: false

    add_column :problems, :solution, :text

  end
end
