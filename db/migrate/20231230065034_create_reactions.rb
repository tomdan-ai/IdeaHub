class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, foreign_key: true
      t.references :comment, foreign_key: true
      t.string :reaction_type

      t.timestamps
    end
  end
end
