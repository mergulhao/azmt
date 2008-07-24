class CreateDisciplinesTeachers < ActiveRecord::Migration
  def self.up
    create_table :disciplines_teachers, :id => false do |t|
      t.references :discipline, :null => false
      t.references :teacher, :null => false
    end
  end

  def self.down
    drop_table :disciplines_teachers
  end
end
