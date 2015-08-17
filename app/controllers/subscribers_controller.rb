class SubscribersController < ApplicationController
  
  #before_filter :authenticate_user!

  def new
  end

  def create
    token = params[:stripeToken]
    email = params[:stripeEmail]

    customer = Stripe::Customer.create(
      card: token,
      plan: 1001,
      email: email
      )

    current_user.role = "premium"
    current_user.stripe_id = customer.id
    current_user.save

    redirect_to root_path

  end

  def cancel_subscription
  end
  

end
