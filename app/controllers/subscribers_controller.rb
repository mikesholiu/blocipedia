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
    current_user.subscription_id = customer.subscriptions.first.id
    current_user.save

    redirect_to root_path

  end

  def cancel_subscription
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.subscription_id).delete
    current_user.role = "standard"
    redirect_to root_path
  end
  

end
