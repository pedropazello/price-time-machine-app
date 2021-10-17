class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :url
      t.decimal :price
      t.string :name

      t.timestamps
    end
  end
end
