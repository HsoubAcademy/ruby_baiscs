class Task

  attr_accessor :title, :description

  def all
    files =  Dir['./db/*']
    if files.length > 0
        files.each do |file|
            file_content = File.read(file).split(',')
            id = file_content[0].split(':')[1]
            title = file_content[1].split(':')[1]
            result = 
                <<~List
                    id: #{id},
                    title: #{title}
                    ==============================
                List
            puts result
        end

    else
        puts "No tasks to display"
    end
  end

  def get(id)
    if (File.file?("./db/#{id}.txt"))
        file_content = File.read("./db/#{id}.txt").split(',')
        id = file_content[0].split(':')[1]
        title = file_content[1].split(':')[1]
        description = file_content[2].split(':')[1]
        result = <<~SingleTask
                    id: #{id},
                    title: #{title}
                    description: #{description}
                    ==============================
                    SingleTask
        puts result
    else
        puts "No task with this id"
    end
    
end

  def save
       id = rand(1..1000)
       task = "id: #{id},title: #{self.title},description: #{self.description}"
       File.open("./db/#{id}.txt", "w") { |f| f.write(task) }
  end

  def update(id)
    if (File.file?("./db/#{id}.txt"))
      task = "id: #{id},title: #{self.title},description: #{self.description}"
      File.open("./db/#{id}.txt", "w") { |f| f.write(task) }
    else
      puts "There is no file to update"
    end
  end

  def delete

  end

  
end