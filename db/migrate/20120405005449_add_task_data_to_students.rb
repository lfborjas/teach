class AddTaskDataToStudents < ActiveRecord::Migration
  def change
    add_column :students, :challenge_id, :integer

    add_column :students, :task_id, :integer

    add_column :students, :latest_task_at, :datetime

  end
end
