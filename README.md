Begin Creating Projects Model

class Project
  has_many :todos


class Todo
  belongs_to :project


#routes.rb

resources :projects do
  resources :todos
end

#todos_controller.rb

def index
  @todos = Project.find(params[:project_id]).todos
end