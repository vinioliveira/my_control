require 'spec_helper'

describe Expense do

  it "Bring the expenses to be pay today" do

    2.times { Factory(:expense) }
    2.times { Factory(:expense, :due_date => Date.tomorrow)}
    
    Expense.all.should have(4).items
    Expense.day_of_expense.should have(2).items
  end
    
  it "Bring the expenses for this month" do

    2.times { Factory(:expense) }
    2.times { Factory(:expense, :due_date => 1.month.from_now)}

    Expense.all.should have(4).items
    Expense.this_month.should have(2).items
  end
  
  it "Bring the expenses of the month" do
    
    2.times { Factory(:expense) }
    2.times { Factory(:expense, :due_date => 1.month.from_now)}
    
    Expense.all.should have(4).items
    Expense.this_month.should have(2).items
  end
  
  
  it "Should return the amount off all Incomes" do
    
    2.times { Factory(:expense, :amount => 10.0)}
    Expense.amount.should be_eql(20.0)
    
  end
  
  
end
