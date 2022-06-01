require "./task.rb"

puts "Programm Started ============="
puts "Please enter operation name"

def run_programm
  puts "\n"
  commands = 
  <<~List
           -------------------------------------------
          | enter 'list' to list all tasks            |
          | enter 'create' to create task             |
          | enter 'update' to update task             |
          | enter 'get' to get specific task          |
          | enter 'delete' to delete task             |
           -------------------------------------------
    List
  
  puts commands
  
  command = gets.chomp

  puts "\n"

  commands_list = ['list', 'create', 'update', 'get', 'delete']

  if (commands_list.include?command) 
      case command
          when 'list'
            Task.new.all
            run_programm
          when 'create'
            task = Task.new
            puts "Enter task title:"
            task.title = gets.chomp
            puts "Enter task description:"
            task.description = gets.chomp
            task.save
            run_programm
          when 'update'

            puts "Enter task id:"
            note_id = gets.chomp
            task = Task.new
            puts "Enter task title:"
            task.title = gets.chomp
            puts "Enter task description:"
            task.description = gets.chomp
            task.update(note_id)
            run_programm
          when 'get'
            puts "Enter task id:"
            Task.new.get(gets.chomp)
            run_programm
          when 'delete'
             puts "delete task"
             run_programm
      end

  else
      puts "Command does not exist, programm will exist"
  end

end

run_programm
