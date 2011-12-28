class HomeController < ApplicationController
  
  def index
    @expenses = current_user.expenses
    @incomes = current_user.incomes
    @expense = Expense.new
    @income = Income.new
    #TODO relevar apenas valores mensais 
  end
end
