class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts, :force => true do |t|
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
      t.string :rg, :limit => 20
      
      t.references :student, :null => false
      t.references :classe, :null => false
      t.string :kinship
      
      t.integer :registration_value
      t.integer :financing_tranche
      t.integer :financing_tranche_number

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
