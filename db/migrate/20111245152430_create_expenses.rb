class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :amount,:precision => 14, :scale => 2, :null => false
      t.datetime :due_date, :null => false
      t.string :description, :null => false
      t.references :user, :null => false
      t.references :category
      
      t.timestamps
    end
    
    add_index :expenses, :category_id
    add_index :expenses, :user_id
  end
end
