class Api::V1::CustomerSubscriptionsController < ApplicationController
  def show
   subscriptions = Subscription.where(customer_id: params[:id])
   customer = Customer.where(id: params[:id])
   if customer.count > 0
    render json: CustomerSubscriptionsSerializer.format_subscriptions(subscriptions), status: 200
   else
    render json: {data: "Error: customer not found"}, status: 404
   end
  end
end