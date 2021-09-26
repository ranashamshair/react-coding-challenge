class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :postal_code
      t.integer :company_id
      t.string :address_type

      t.timestamps
    end

    add_index :addresses, :city
    add_index :addresses, :state
    add_index :addresses, :company_id

    add_foreign_key :addresses, :companies
  end
end
