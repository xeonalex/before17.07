class Person < ActiveRecord::Base
  has_many :accounts
  has_many :computers, through: :accounts
end

class Computer
  has_many :accounts
  has_many :people, through: :accounts
end

class Account < ActiveRecord::Base
  belongs_to :person
  belongs_to :computer
end



class CreateAccounts < ActiveRecord::Migration[5.1]

  def change
    create_table :accounts do |t|
      t.integer :person_id, index: true
      t.integer :computer_id, index: true
      t.datetime :registration_date
      t.time :work_time
      t.timestamps
    end
  end

end