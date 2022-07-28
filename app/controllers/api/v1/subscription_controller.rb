class Api::V1::SubscriptionController < ApplicationController

  def create
   subscription = Subscription.create(subscription_params)
   
   if subscription.id != nil
    render json: {data: "Subscription added"},  status: 201
   else
    render json: {data: "Error: missing attribute(s)"}, status: 400
   end
  end

  def cancel
    subscription = Subscription.where(title: params[:title], customer_id: params[:customer_id]).first

    if subscription
      subscription.update(subscription_params)
      subscription.save
      render json: {data: "Subscription cancelled"},  status: 200
    else
      render json: {data: "Error: subscription not found"}, status: 404
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end