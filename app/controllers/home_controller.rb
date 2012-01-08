class HomeController < ApplicationController
  
  def index
    @expenses = current_user.expenses
    @incomes = current_user.incomes
    @expense = Expense.new
    @income = Income.new
    @category = Category.new
    #TODO exibir apenas valores mensais 
  end
end
