class CreateMoneyCalculations < ActiveRecord::Migration
  def change
    create_table :money_calculations do |t|
      t.integer :calculation_amount
      t.belongs_to :organisation_money
      t.belongs_to :user
      t.timestamps
    end
  end
end
