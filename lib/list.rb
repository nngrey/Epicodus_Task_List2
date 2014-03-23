class List

	attr_reader :name, :id

	def initialize(attributes)
		@name = attributes['name']
	end

	def self.all
		results = DB.exec("Select * FROM lists;")
		lists = []
		results.each do |result|
			name = result['name']
			new_list = List.new({'name' => name})
			lists << new_list
		end
		lists
	end

	def self.create(attributes)
		new_list = List.new(attributes)
		new_list.save
		new_list
	end

	def save
		results = DB.exec("INSERT INTO lists (name) VALUES ('#{name}') RETURNING id;")
		@id =  results.first['id']
	end

	def update_name(new_name)
		DB.exec("UPDATE lists SET name = '#{new_name}' WHERE id = #{self.id};")
	end

	def delete
		DB.exec("DELETE FROM lists WHERE id = #{self.id}")
	end

	def ==(another_list)
		self.name == another_list.name
	end

end