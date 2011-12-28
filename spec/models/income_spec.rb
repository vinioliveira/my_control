require 'spec_helper'

describe Income do
  
  it "Bring the incomes for the month" do
    
    2.times { Factory(:income) }
    2.times { Factory(:income, :date_of_credit => 1.month.from_now)}
    
    Income.all.should have(4).items
    Income.this_month.should have(2).items
  end
  
  
  it "Should return the amount off all Incomes" do
    
    2.times { Factory(:income, :amount => 10.0)}
    Income.amount.should be_eql(20.0)
    
  end

end
