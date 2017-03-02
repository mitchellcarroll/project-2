class DashboardController < ApplicationController

  def index
    @assets = Asset.all
    @expenses = Expense.all
  end

  def new
    @asset = Asset.new
    @expense = Expense.new
  end

  def create
    @asset = Asset.new(asset_params.merge(user: current_user))
    if @asset.save
      puts "assets saved"
    end
    @expense = Expense.new(expense_params.merge(user: current_user))
    if @expense.save
    end
  end

  private
  def asset_params
    params.require(:asset).permit(:id, :category, :value)
  end
  def expense_params
    params.require(:expense).permit(:id, :category, :value)
  end
end
