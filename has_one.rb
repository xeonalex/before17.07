# при belongs_to вторинний ключ добавляється в дану модель



class User < ActiveRecord::Base
  has_one :cart, primary_key: 'buyer_id', dependent: :delete # видаляємо без колбеків залежні елементи
end

class Cart < ActiveRecord::Base

end



class CreateUserCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :buyer_id, primary_key: true
      t.string :username
      t.string :email
      t.string :password
    end

    create_table :carts do |t|
      t.referenses :user
      t.integer :sum
      t.integer :amount_of_items
    end
  end
end
