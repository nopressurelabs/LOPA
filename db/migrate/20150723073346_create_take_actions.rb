class CreateTakeActions < ActiveRecord::Migration
  def change
    create_table :take_actions do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, index: true
      t.boolean :subscribe, default: false
      t.string :zipcode
      t.string :city
      t.string :country
      t.boolean :us_based, default: true
      t.boolean :anonymous, default: false
      t.timestamps null: false
    end
  end
end
