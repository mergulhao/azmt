class AddAutodeskCodeToTeachers < ActiveRecord::Migration
  def self.up
    add_column :teachers, :autodesk_code, :string
  end

  def self.down
    remove_column :teachers, :autodesk_code
  end
end
