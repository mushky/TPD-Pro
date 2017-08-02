class TodosController < ApplicationController
  def index
  	@todos = Todo.all.order("created_at DESC")
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(todo_params)
  	@todo.save

  	redirect_to @todo
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
    	params.require(:todo).permit(:name,:due_date,:complete)
    end
end
