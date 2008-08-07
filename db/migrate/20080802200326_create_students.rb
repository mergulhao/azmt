class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name, :null => false
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighbourhood
      t.string :zip
      t.string :home_phone
      t.string :comercial_phone
      t.string :mobile_phone
      t.string :cpf, :limit => 11

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
