class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :avatar_url
      t.integer :business_structure_id
      t.string :duns_number
      t.integer :naics_code_id

      t.timestamps
    end

    add_index :companies, :name
    add_index :companies, :business_structure_id
    add_index :companies, :naics_code_id

    add_foreign_key :companies, :business_structures
    add_foreign_key :companies, :naics_codes
  end
end
