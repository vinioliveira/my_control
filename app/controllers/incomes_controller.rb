class IncomesController < ApplicationController
  
  before_filter :standardise_numbers, :only => [ :create, :update ]  
  
  # GET /incomes
  # GET /incomes.json
  def index
    @incomes = Income.all

    respond_to do |format|
      format.json { render json: @incomes }
    end
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    @income = Income.find(params[:id])

    respond_to do |format|
      format.json { render json: @income }
      format.js
    end
  end

  # GET /incomes/new
  # GET /incomes/new.json
  def new
    @income = Income.new

    respond_to do |format|
      format.json { render json: @income }
      format.js
    end
  end

  # GET /incomes/1/edit
  def edit
    @income = Income.find(params[:id])
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(params[:income])
    @income.user = current_user
    respond_to do |format|
      if @income.save
        format.json { render json: @income, status: :created, location: @income }
        format.js
      else
        format.json { render json: @income.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /incomes/1
  # PUT /incomes/1.json
  def update
    @income = Income.find(params[:id])

    respond_to do |format|
      if @income.update_attributes(params[:income])
        format.json { head :ok }
        format.js
      else
        format.json { render json: @income.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income = Income.find(params[:id])
    @income_id = @income.id
    @income.destroy

    respond_to do |format|
      format.json { head :ok }
      format.js
    end
  end
end
