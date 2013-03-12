class AddAmountToOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :amount, :integer
  end
end
