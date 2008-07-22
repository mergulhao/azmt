class ChangeFromDatetimeToDateAndTimeOnLessons < ActiveRecord::Migration
  def self.up
    AddDatetimeStartAndDatetimeEndToLessons.down

    change_table :lessons do |t|
      t.date :date, :null => false
      t.time :start_time, :null => false
      t.time :end_time, :null => false
    end
  end

  def self.down
    AddDatetimeStartAndDatetimeEndToLessons.up
    
    change_table :lessons do |t|
      t.remove :date, :start_time, :end_time
    end
  end
end
