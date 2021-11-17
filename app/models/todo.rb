require "date"
require "active_record"

class Todo < ActiveRecord::Base
  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end

  def self.show_list
    puts("My Todo-list\n")
    puts("Overdue \n")
    overdue?.map { |todo| puts todo.to_displayable_string }

    puts("\nDue Today\n")
    due_today?.map { |todo| puts todo.to_displayable_string }

    puts("\nDue Later\n")
    due_later?.map { |todo| puts todo.to_displayable_string }
  end

  def self.add_task(todo_row)
    Todo.create!(todo_text: todo_row[:todo_text], due_date: Date.today + todo_row[:due_in_days], completed: false)
  end

  def self.mark_as_complete(todo_id)
    Todo.update(todo_id, completed: true)
  end
end
