class AddOrderingToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :ordering, :integer

  end
end
