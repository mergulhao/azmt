class ChangeAddressFieldsOnStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.remove :street
      t.remove :number
      t.remove :complement
      t.remove :neighbourhood
      t.remove :zip
      
      t.string :address_street
      t.string :address_number
      t.string :address_complement
      t.string :address_neighbourhood
      t.string :address_zip
      
      t.string :address_state
      t.string :address_city
    end
  end

  def self.down
    change_table :students do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighbourhood
      t.string :zip
      
      t.remove :address_street
      t.remove :address_number
      t.remove :address_complement
      t.remove :address_neighbourhood
      t.remove :address_zip
      
      t.remove :address_state
      t.remove :address_city
    end
  end
end
