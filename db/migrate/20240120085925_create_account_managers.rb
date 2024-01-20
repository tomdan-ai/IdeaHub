class CreateAccountManagers < ActiveRecord::Migration[7.1]
  def change
    create_table :account_managers do |t|

      t.timestamps
    end
  end
end
