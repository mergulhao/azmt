class AddTeacherDisciplineToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.references :teacher, :null => false
      t.references :discipline, :null => false
    end
  end

  def self.down
    change_table :lessons do |t|
      t.remove_references :teacher
      t.remove_references :discipline
    end
  end
end
