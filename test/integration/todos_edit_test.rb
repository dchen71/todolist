require 'test_helper'

class TodosEditTest < ActionDispatch::IntegrationTest

  def setup
    @todo = todos(:one)
  end

  test "unsuccessful edit" do
    get edit_todo_path(@todo)
    assert_template 'todos/edit'
    patch todo_path(@todo), todo: { todo_item: " "}
    assert_template 'todos/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_todo_path(@todo)
    assert_template 'todos/edit'
    patch todo_path(@todo), todo: { todo_item: "correct"}
    assert_not flash.empty?
    assert_redirected_to root_path
    assert_equal "correct",  Todo.find_by(id: @todo.id).todo_item
  end
end