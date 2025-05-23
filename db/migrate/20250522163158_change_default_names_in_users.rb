class ChangeDefaultNamesInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :first_name, from: "f", to: nil
    change_column_default :users, :last_name, from: "f", to: nil
  end
end
