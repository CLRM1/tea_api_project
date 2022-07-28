class Api::V1::SubscriptionController < ApplicationController

  def create
    Subscription.create(subscription_params)
    render json: {data: "Subscription added"},  status: 201
  end

  def cancel
    subscription = Subscription.where(title: params[:title], customer_id: params[:customer_id]).first
    subscription.update(subscription_params)
    subscription.save
    render json: {data: "Subscription cancelled"},  status: 200
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end