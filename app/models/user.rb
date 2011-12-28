class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :expenses, :dependent => :destroy
  has_many :incomes, :dependent => :destroy
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  def balance
    incomes.amount - expenses.amount 
  end

end
