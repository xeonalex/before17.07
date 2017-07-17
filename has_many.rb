class User < ActiveRecord::Base
  has_many :orders, class_name: 'UserOrder', counter_cache: :amount_of_items
end

class UserOrder < ActiveRecord::Base
  belongs_to :user, inverse_of: 'order'
end

class CreateUserOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
    end

    create_table :orders do |t|
      t.integer :sum
      t.integer :amount_of_items
    end
  end
end
