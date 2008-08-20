class AddLessonsNumberToDisciplines < ActiveRecord::Migration
  def self.up
    change_table :disciplines do |t|
      t.column :lessons_number, :integer, :null => false
    end
  end

  def self.down
    change_table :disciplines do |t|
      t.remove :lessons_number
    end
  end
end
