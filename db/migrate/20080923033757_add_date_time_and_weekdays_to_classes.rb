class AddDateTimeAndWeekdaysToClasses < ActiveRecord::Migration
  def self.up
    change_table :classes do |t|
      t.date :start_date
      t.time :start_time
      t.time :end_time
      t.string :weekdays
      t.references :classroom
    end
  end

  def self.down
    change_table :classes do |t|
      t.remove :start_date
      t.remove :start_time
      t.remove :end_time
      t.remove :weekdays
      t.remove :classroom_id
    end
  end
end
