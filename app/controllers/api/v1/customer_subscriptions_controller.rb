class Api::V1::CustomerSubscriptionsController < ApplicationController
  def show
    Subscription.where(customer_id: params[:customer_id])
  end
end