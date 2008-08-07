class AddExternalToClassrooms < ActiveRecord::Migration
  def self.up
    add_column :classrooms, :external, :boolean, :default => true
  end

  def self.down
    remove_column :classrooms, :external
  end
end
