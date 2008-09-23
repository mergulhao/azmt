class AddFieldsToStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.date :birth
      t.string :email
      
      t.string :work_company
      t.string :work_profession
      t.string :work_position
      
      t.string :rg, :limit => 20
    end
  end

  def self.down
    change_table :students do |t|
      t.remove :birth
      t.remove :email
      
      t.remove :work_company
      t.remove :work_profession
      t.remove :work_position
      
      t.remove :rg
    end
  end
end
