class AddClassroomIdToDisciplines < ActiveRecord::Migration
  def self.up
    add_column :disciplines, :classroom_id, :integer
  end

  def self.down
    remove_column :disciplines, :classroom_id
  end
end
