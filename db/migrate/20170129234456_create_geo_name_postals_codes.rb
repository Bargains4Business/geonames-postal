class CreateGeoNamePostalsCodes < ActiveRecord::Migration
  def change
    create_table :geo_name_postals_codes do |t|
      t.string :country_code
      t.string :postal_code
      t.string :place_name
      t.string :admin_name1
      t.string :admin_code1
      t.string :admin_name2
      t.string :admin_code2
      t.string :admin_name3
      t.string :admin_code3
      t.string :latitude
      t.string :longitude
      t.integer :accuracy
      t.string :country_alpha3
      t.string :country_name

      t.timestamps null: false
    end

    add_index :geo_name_postals_codes, :country_code
    add_index :geo_name_postals_codes, :country_alpha3
    add_index :geo_name_postals_codes, :country_name
    add_index :geo_name_postals_codes, :postal_code
  end
end
