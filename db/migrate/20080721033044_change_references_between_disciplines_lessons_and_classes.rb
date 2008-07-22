class ChangeReferencesBetweenDisciplinesLessonsAndClasses < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.remove_references :discipline
      t.references :classe, :null => false
      t.references :classroom, :null => false
    end

    change_table :disciplines do |t|
      t.remove_references :teacher
      t.remove_references :classroom
    end
  end

  def self.down
    change_table :lessons do |t|
      t.references :discipline, :null => false
      t.remove_references :classe, :null => false
      t.remove_references :classroom, :null => false
    end
    
    change_table :disciplines do |t|
      t.references :teacher, :null => false
      t.references :classroom, :null => false
    end
  end
end
