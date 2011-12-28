class ExpensesController < ApplicationController

  before_filter :standardise_numbers, :only => [ :create, :update ]  
  
  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])

    respond_to do |format|
      format.json { render json: @expense }
      format.js
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new

    respond_to do |format|
      format.json { render json: @expense }
      format.js
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
  end

  # POST /expenses
  # POST /expenses.json
  def create

    @expense = Expense.new(params[:expense])
    @expense.user = current_user

    respond_to do |format|
      if @expense.save
        format.json { render json: @expense, status: :created, location: @expense }
        format.js
      else
        format.json { render json: @expense.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.json { head :ok }
        format.js
      else
        format.json { render json: @expense.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense_id = @expense.id
    @expense.destroy

    respond_to do |format|
      format.json { head :ok }
      format.js
    end
  end
end
