class CustomerSubscriptionsSerializer
  
  def self.format_subscriptions(customer_data)
    customer_data.each do |subscription| 
      {
        data: {
          # require 'pry'; binding.pry
          title: subscription.title,
          status: subscription.status, 
          price: subscription.price, 
          frequency: subscription.frequency
        }
      }
    end
  end
end