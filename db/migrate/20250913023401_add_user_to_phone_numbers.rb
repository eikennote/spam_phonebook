class AddUserToPhoneNumbers < ActiveRecord::Migration[8.0]
  def change
    add_reference :phone_numbers, :user, null: false, foreign_key: true
  end
end
