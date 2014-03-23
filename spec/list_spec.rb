require 'spec_helper'

describe List do

	describe "initialize" do
		it 'initializes a new list with a name' do
			test_list = List.new({'name' => 'chores'})
			test_list.should be_an_instance_of List
			test_list.name.should eq 'chores'
		end
	end

	describe ".all" do
		it 'starts off as empty' do
			List.all.should eq []
		end
	end

	describe ".create" do
		it "initializes and saves an instance of List" do
			test_list = List.create({'name' => 'chores'})
			List.all.should eq [test_list]
		end
	end

	describe "#save" do
		it "saves and instance of List to an array of all lists" do
			test_list = List.new({'name' => 'chores'})
			test_list.save
			List.all.should eq [test_list]
		end
	end

	describe "#update_name" do
		it 'updates the name of an instance' do
			test_list = List.create({'name' => 'home chores'})
			test_list.update_name('work chores')
		end
	end

	describe "#delete" do
		it 'deletes the instance of List' do
			test_list = List.create({'name' => 'chores'})
			test_list.delete
			List.all.should eq []
		end
	end

	describe "==" do
		it "is the same list if it has the same name" do
			test_list1 = List.new({'name' => 'chores'})
			test_list2 = List.new({'name' => 'chores'})
			test_list1.should eq test_list2
		end
	end
end