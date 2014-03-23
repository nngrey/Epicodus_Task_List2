class Task

	attr_reader :name, :id

	def initialize(attributes)
		@name = attributes['name']
		@id = attributes['id']
	end

	def self.all 
		results = DB.exec("SELECT * FROM tasks;")
		tasks = []
		results.each do |result|
			name = result['name']
			new_task = Task.new({'name' => name})
			tasks << new_task
		end
		tasks
	end

	def self.create(attributes)
		new_task = Task.new(attributes)
		new_task.save
		new_task
	end

	def save
		results = DB.exec("INSERT INTO tasks (name) VALUES ('#{@name}') RETURNING id;")
		@id = results.first['id']
	end

	def update(name)
		DB.exec("UPDATE tasks SET name = '#{name}' WHERE id = #{self.id};")
	end

	def delete
		DB.exec("DELETE FROM tasks WHERE id = #{self.id}")
	end

	def ==(another_task)
		self.name == another_task.name
	end



end