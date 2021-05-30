class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal,         null: false
      t.integer    :prefecture_id,  null: false         
      t.string     :municipalities, null: false 
      t.string     :address,        null: false
      t.string     :buildingname
      t.string     :phone,          null: false
      t.references :buy,            foreign_key: true 

      t.timestamps
    end
  end
end
