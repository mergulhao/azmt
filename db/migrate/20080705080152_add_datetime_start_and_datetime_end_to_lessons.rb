class AddDatetimeStartAndDatetimeEndToLessons < ActiveRecord::Migration
  def self.up
    add_column :lessons, :datetime_start, :datetime
    add_column :lessons, :datetime_end, :datetime
  end

  def self.down
    remove_column :lessons, :datetime_start
    remove_column :lessons, :datetime_end
  end
end
