class HomeController < ApplicationController
  
  def index
    @expenses = current_user.expenses.this_month
    @incomes = current_user.incomes.this_month
    @expense = Expense.new
    @income = Income.new
    @category = Category.new
    #TODO exibir apenas valores mensais 
  end
end
