class CreateClasses < ActiveRecord::Migration
  def self.up
    create_table :classes do |t|
      t.references :discipline, :null => false
      t.references :teacher, :null => false
      t.references :classroom, :null => false
      
      t.date :start_date
      t.time :start_time
      t.time :end_time
      t.string :repeat_on
      t.integer :lessons_number
      
      t.timestamps
    end
  end

  def self.down
    drop_table :classes
  end
end
