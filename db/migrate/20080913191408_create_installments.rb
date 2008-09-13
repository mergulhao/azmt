class CreateInstallments < ActiveRecord::Migration
  def self.up
    create_table :installments do |t|
      t.references :contract, :null => false
      t.date :due_date
      t.string :bank_number
      t.string :bank_branch
      t.string :bank_account
      t.string :bank_check
      t.decimal :value, :precision => 14, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :installments
  end
end
