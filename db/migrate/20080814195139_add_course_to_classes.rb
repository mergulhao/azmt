class AddCourseToClasses < ActiveRecord::Migration
  def self.up
    change_table :classes do |t|
      t.references :course, :null => false
    end
  end

  def self.down
    change_table :classes do |t|
      t.remove_references :course
    end
  end
end
