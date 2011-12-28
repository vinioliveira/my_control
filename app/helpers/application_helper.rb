module ApplicationHelper
  
  def calc_balance_formated
    number_to_currency( current_user.balance )
  end
end
