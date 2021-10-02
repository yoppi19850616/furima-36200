class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,    null: false
      t.string     :municipalities, null: false
      t.string     :number_address, null: false
      t.string     :building_name,  null: false
      t.string     :phone_number,   null: false
      t.references :buyer,          null: false, foreign_key:true
      t.integer    :area_id,        null: false

      t.timestamps
    end
  end
end
