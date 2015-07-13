# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Todo.create(todo_item: "Become a cat", completed: true)
Todo.create(todo_item: "Eat a dog", completed: false)
Todo.create(todo_item: "Find dat food", completed: true)
Todo.create(todo_item: "Mutate to catdog", completed: true)