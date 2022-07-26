class Api::V1::SubscriptionController < ApplicationController

  def create
    Subscription.create(title: params[:title], 
                         price: params[:price], 
                         status: params[:status], 
                         frequency: params[:frequency], 
                         customer_id: params[:customer_id], 
                         tea_id: params[:tea_id])
    render json: {data: "Subscription added"},  status: 201
  end

end