#використовуємо коли у нас однакові по структурі дані але необхідні різні методи і контролери

class PhoneNumber < ActiveRecord::Base
  belongs_to :person, touch:true # touch - для оновлення часових міток update_at
end

class PrimaryPhone < PhoneNumber
  # свої методи
end

class SecondaryPhone < PhoneNumber
  # свої методи
end

class CreateNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :persons do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
    end

    create_table :phone_numbers do |t|
      t.belongs_to :person
      t.integer :area_code
      t.integer :number
      t.string :type
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end