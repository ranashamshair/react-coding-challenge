class CreateBusinessStructures < ActiveRecord::Migration[6.1]
  def change
    create_table :business_structures do |t|
      t.string :name
      t.timestamps
    end

    add_index :business_structures, :name
  end
end
