class TodosController < ApplicationController
  def index #shows all values of the todo list
    @todo_items = Todo.all
    @new_todo = Todo.new
    
    render :index
  end
  
  def edit #used to help edit an entry
    @todo = Todo.find_by(id: params[:id])
  end

  def update #updates an entry
    @todo = Todo.find_by(id: params[:id])
    if @todo.update(todo_params)
      flash[:success] = "Todo updated"
      redirect_to root_path
    else
      flash[:error] = "Todo cannot be empty"
      render 'edit'
    end
  end

  def delete #deletes selected todo item
    Todo.find_by(id: params[:id]).destroy
    flash[:success] = "Todo successfully deleted"
    
    redirect_to root_url
  end


  def create #add values if valid based on params sent, and sets errors if necessary
    todo = Todo.create(todo_params)
    if !todo.valid?
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] ="Todo added successfully"
    end
    redirect_to root_url
  end
    
    def complete #if checked then each thing that is checked is striked through, error if click when nothing
      if !params[:todos_checkbox].nil?
        params[:todos_checkbox].each do |check|
          todo_id = check
            t = Todo.find_by_id(todo_id)
            t.update_attribute(:completed, !t.completed)
        end
        redirect_to root_url
      else
        flash[:error] = "Please check completed to do items"
        redirect_to root_url
      end
    end

  private
    def todo_params
      params.require(:todo).permit(:todo_item, :completed)
    end
end