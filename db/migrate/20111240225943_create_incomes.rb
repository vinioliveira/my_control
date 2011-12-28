class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.decimal :amount, :precision => 14, :scale => 2, :null => false
      t.datetime :date_of_credit, :null => false
      t.string :description, :null => false
      t.references :user, :null => false
      t.references :category

      t.timestamps
    end
    add_index :incomes, :user_id
    add_index :incomes, :category_id
  end
end
