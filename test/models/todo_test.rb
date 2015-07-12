require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  def setup
  	@todo = Todo.new(todo_item: "Become a cat")
  end

  test "should be valid" do
  	assert @todo.valid?
  end

  test "todo_item should be present" do
  	@todo.todo_item = "         "
    assert_not @todo.valid?
  end
end
