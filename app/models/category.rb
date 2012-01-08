class Category < ActiveRecord::Base
  has_many :incomes
  has_many :expenses
end
