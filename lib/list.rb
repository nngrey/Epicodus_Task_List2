class List

	attr_reader :name

	def initialize(attributes)
		@name = attributes['name']
	end

	def List.all
		results = DB.exec("Select * FROM lists;")
		lists = []
		results.each do |result|
			name = result['name']
			new_list = List.new({'name' => name})
			lists << new_list
		end
		lists
	end

	def save
		results = DB.exec("INSERT INTO lists (name) VALUES ('#{name}') RETURNING id;")
	end

	def ==(another_list)
		self.name == another_list.name
	end

end