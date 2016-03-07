class ChargesController < ApplicationController
  skip_before_filter :authenticate

  def create
    # Amount in cents
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    redirect_to root_url, notice: "Thanks sucker!!!"
  rescue Stripe::CardError => e
    redirect_to new_charge_path, alert: e.message
  end
end
