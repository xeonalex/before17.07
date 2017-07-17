#так як у нас використовується foreign_key, то тепер
# двонаправлений звязок не буде працювати,
# тому оприділимо опцію inverse_of

# при belongs_to вторинний ключ добавляється в дану модель

class User < ActiveRecord::Base
  has_one :profile, inverse_of: 'user'
end


class Profile < ActiveRecord::Base
  belongs_to :user, dependant: :destroy, foreign_key: "player_id"
end


class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
    end

    create_table :profiles do |t|
      t.integer :player_id  # вказуємо ключ явно
      t.string :age
      t.integer :balance
      t.integer :win_rate
      t.datetime :last_game

      add_index :profiles , :player_id
    end
  end
end
