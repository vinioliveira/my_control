class Income < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :category
  
  validates :user,  :amount, :description, :date_of_credit, :presence => true
  validates :amount, :numericality => {:greater_than => 0} 
  
  class << self 
    def this_month
      where(:date_of_credit => Date.today.beginning_of_month... Date.today.end_of_month)
    end
    
    def amount
      sum(:amount)
    end
  end  
  
end