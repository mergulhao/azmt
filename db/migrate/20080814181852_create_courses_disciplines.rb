class CreateCoursesDisciplines < ActiveRecord::Migration
  def self.up
    create_table :courses_disciplines, :id => false do |t|
      t.references :course, :null => false
      t.references :discipline, :null => false
    end
  end

  def self.down
    drop_table :courses_disciplines
  end
end
