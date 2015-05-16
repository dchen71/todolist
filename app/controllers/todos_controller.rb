class TodosController < ApplicationController
  def index #shows all values of the todo list
    @todo_items = Todo.all
    @new_todo = Todo.new
    
    render :index
  end
  
  def delete #deletes the last item
    @todo_items = Todo.last.delete
  end
  
  def add #add values if valid based on params sent, and sets errors if necessary
    todo = Todo.create(:todo_item => params[:todo][:todo_item])
    if !todo.valid?
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] ="Todo added successfully"
    end
    redirect_to :action => 'index'
  end
    
    def complete #if checked then each thing that is checked is striked through
     params[:todos_checkbox].each do |check|
       todo_id = check
	   t = Todo.find_by_id(todo_id)
       t.update_attribute(:completed, !t.completed)
     end
    redirect_to :action => 'index'
    end
end