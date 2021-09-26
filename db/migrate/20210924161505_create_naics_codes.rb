class CreateNaicsCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :naics_codes do |t|
      t.string :title
      t.text :description
      t.string :code
      t.integer :sector_id
      t.integer :subsector_id
      t.integer :industry_group_id
      t.integer :naics_industry_id

      t.timestamps
    end

    add_index :naics_codes, :code
    add_index :naics_codes, :sector_id
    add_index :naics_codes, :subsector_id
    add_index :naics_codes, :industry_group_id
    add_index :naics_codes, :naics_industry_id
  end
end
