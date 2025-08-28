class CreatePhoneNumbers < ActiveRecord::Migration[8.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.text :description
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
