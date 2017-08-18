class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos.all.order("created_at DESC")
    @todo = current_user.todos.new    
  end

  def new
  	@todo = current_user.todos.new
  end
  
  def create
    #binding.pry
    @todos = Todo.all
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
    	if @todo.save
        flash[:success] = "Todo added"
        format.html { redirect_to todos_path, notice: 'Todo added' }      
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end


  def edit
    @todo = Todo.find(params[:id])    
    #respond_to do |format|
      #format.html { render :edit }
      #format.js {}
    #end

  end

  def update
    @todo = Todo.find(params[:id])
    #respond_to do |format|
      if @todo.update_attributes(todo_params)
        redirect_to todos_path
    	  #format.html { redirect_to @todo, notice: "Todo Updated" }
        #format.js
      else
    	  render 'edit'
      end
    #end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
 
    redirect_to todos_path
  end  

  private
    def todo_params
    	params.require(:todo).permit(:name,:due_date,:complete,:user_id)
    end
end
