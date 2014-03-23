class Task

	attr_reader :name, :id, :list_id

	def initialize(attributes)
		@name = attributes['name']
		@list_id = attributes['list_id']
		@id = attributes['id']
	end

	def self.all 
		results = DB.exec("SELECT * FROM tasks;")
		tasks = []
		results.each do |result|
			name = result['name']
			list_id = result['list_id']
			new_task = Task.new({'name' => name, 'list_id' => list_id})
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
		results = DB.exec("INSERT INTO tasks (name, list_id) VALUES ('#{@name}', '#{list_id}') RETURNING id;")
		@id = results.first['id']
	end

	def update_name(new_name)
		DB.exec("UPDATE tasks SET name = '#{new_name}' WHERE id = #{self.id};")
	end

	def delete
		DB.exec("DELETE FROM tasks WHERE id = #{self.id}")
	end

	def ==(another_task)
		self.name == another_task.name
	end



end