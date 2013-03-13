class AddOrganisationNameToMoneyCalculation < ActiveRecord::Migration
  def change
    add_column :money_calculations, :organisation_name, :string
  end
end
