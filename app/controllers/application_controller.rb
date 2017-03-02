class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_totals
  protect_from_forgery with: :exception

  def set_totals
    @total_expenses= Expense.all.map { |expense| expense.value }.sum
    # @total_expenses= number_to_currency(@total_expenses)
    @total_assets= Asset.all.map { |asset| asset.value }.sum
    # @total_assets= number_to_currency(@total_assets)
    @net_total = @total_assets - @total_expenses
  end

end
