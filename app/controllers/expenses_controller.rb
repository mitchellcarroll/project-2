class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
    # This current code will show every user the same expenses and assets. If you
    # wanted to show each user accounts specific to them, you would have to query
    # for associations based on current_user. Same for the other controller actions.
    #
    # @expenses = current_user.expenses
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create!(expense_params.merge(user: current_user))
    if @expense.save
      redirect_to @expense
    end
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update!(expense_params)
    @expense.save

    redirect_to expense_path(@expense)
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to expenses_path(@expense)
  end

  private
  def expense_params
    params.require(:expense).permit(:category, :value)
  end

end
