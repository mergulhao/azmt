class RemoveDisciplineTeacherClassroomFromClasses < ActiveRecord::Migration
  def self.up
    change_table :classes do |t|
      t.remove_references :teacher
      t.remove_references :discipline
      t.remove_references :classroom
    end
  end
  
  def self.down
    change_table :classes do |t|
      t.references :teacher, :null => false
      t.references :discipline, :null => false
      t.references :classroom, :null => false
    end
  end
end


