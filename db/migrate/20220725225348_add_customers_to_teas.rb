class AddCustomersToTeas < ActiveRecord::Migration[5.2]
  def change
    add_reference :teas, :customer, foreign_key: true
  end
end
