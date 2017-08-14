class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos.all.order("created_at DESC")
  end

  def new
  	@todo = current_user.todos.new
  end


  def create
    @todo = current_user.todos.new(todo_params)
  	if @todo.save
      redirect_to @todo
    else
      render 'new'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end


  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update_attributes(todo_params)
    	redirect_to @todo
    else
    	render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end  

  private
    def todo_params
    	params.require(:todo).permit(:name,:due_date,:complete,:user_id)
    end
end
