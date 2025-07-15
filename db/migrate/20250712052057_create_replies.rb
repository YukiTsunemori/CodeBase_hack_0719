class CreateReplies < ActiveRecord::Migration[8.0]
  def change
    create_table :replies do |t|
      t.string :text, null: false
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
