class AddProjectToTodos < ActiveRecord::Migration[5.1]
  def change
    add_reference :todos, :project, foreign_key: true
  end
end
