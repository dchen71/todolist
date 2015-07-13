require 'test_helper'

class TodosCheckboxTest < ActionDispatch::IntegrationTest

  def setup
    @todo = todos(:one)
  end

  test "not completed" do
    assert_not @todo.completed?
  end

  test "successful complete" do
    post complete_path, todos_checkbox: [@todo.id]
    assert_redirected_to root_path
    assert Todo.find_by(id: @todo.id).completed?
  end

  test "successful uncomplete" do
    (1..2).each do |f|
      post complete_path, todos_checkbox: [@todo.id]
      assert_redirected_to root_path
    end

    assert_not Todo.find_by(id: @todo.id).completed?
  end
end