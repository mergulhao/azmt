class RemoveOldFieldsAndAddNameToClasses < ActiveRecord::Migration
  def self.up
    change_table :classes do |t|
      t.remove :start_date, :start_time, :end_time, :repeat_on, :lessons_number
      t.string :name, :null => false
    end
  end

  def self.down
    change_table :classes do |t|
      t.date :start_date
      t.time :start_time
      t.time :end_time
      t.string :repeat_on
      t.integer :lessons_number

      t.remove :name
    end
  end
end
