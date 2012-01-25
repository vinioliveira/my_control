class Expense < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  validates :user, :amount, :description, :category, :due_date, :presence => true
  validates :amount, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0} 



  #=> Beginning Scopes
  class << self
    
    def day_of_expense
      where(:due_date => Date.today.midnight...Date.tomorrow.midnight)
    end
    
    def this_month
      where(:due_date => Date.today.beginning_of_month... Date.today.end_of_month)
    end
    
    def amount
      sum(:amount)
    end
  end #=> end of scopes
end