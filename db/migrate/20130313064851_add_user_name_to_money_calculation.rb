class AddUserNameToMoneyCalculation < ActiveRecord::Migration
  def change
    add_column :money_calculations, :user_name, :string
  end
end
