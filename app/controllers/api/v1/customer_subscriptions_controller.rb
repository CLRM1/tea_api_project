class Api::V1::CustomerSubscriptionsController < ApplicationController
  def show
   subscriptions = Subscription.where(customer_id: params[:id])
   render json: CustomerSubscriptionsSerializer.format_subscriptions(subscriptions), status: 200
  end
end