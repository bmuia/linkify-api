class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :short_code
      t.integer :clicked, default: 0

      t.timestamps
    end
  end
end
