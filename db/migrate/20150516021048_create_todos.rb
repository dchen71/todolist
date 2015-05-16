class CreateTodos < ActiveRecord::Migration
	def change
		create_table :todos do |t|
			t.string :todo_item #table of string of items

			t.timestamps #has timestamps of when item was created
    	end
	end
end
