class CreateOrganisationMoneys < ActiveRecord::Migration
  def change
    create_table :organisation_moneys do |t|
      t.integer :total_amount
      t.belongs_to :organisation
      t.timestamps
    end
  end
end
