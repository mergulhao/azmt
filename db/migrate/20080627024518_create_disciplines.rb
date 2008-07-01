class CreateDisciplines < ActiveRecord::Migration
  def self.up
    create_table :disciplines do |t|
      t.string :name, :null => false
      t.references :teacher, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :disciplines
  end
end
