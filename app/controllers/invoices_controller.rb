class InvoicesController < ApplicationController
  def subscribe
    @invoice = current_user.invoices.new
    amt = 0
    @invoice.save
    current_user.cart.exercises.each do |exercise|
      @invoice_item = @invoice.invoice_items.new
      @invoice_item.price = exercise.price
      amt += exercise.price
      @invoice_item.exercise = exercise
      @invoice_item.save
    end
    @invoice.amount = amt
    @invoice.save
    current_user.cart.destroy
    flash[:notice] = "Subscribed"
    redirect_to show_invoice_path(@invoice.id)
  end

  def show
    @invoice = current_user.invoices.find_by_id(params[:id])
    render layout: 'empty'
  end

  def index
    @invoices = current_user.invoices
    render layout: 'empty'
  end
end
