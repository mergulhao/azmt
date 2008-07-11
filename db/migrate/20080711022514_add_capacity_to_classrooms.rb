class AddCapacityToClassrooms < ActiveRecord::Migration
  def self.up
    add_column :classrooms, :capacity, :integer, :null => false
  end

  def self.down
    remove_column :classrooms, :capacity
  end
end
