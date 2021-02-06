class CreateExpanses < ActiveRecord::Migration[5.2]
  def change
    create_table :expanses do |t|
      t.string :title
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
