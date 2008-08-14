class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses, :force => true do |t|
      t.string :name, :null => false
      t.string :color, :limit => 6, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
