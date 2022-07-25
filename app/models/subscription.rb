class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency
  # belongs_to :customer, :tea
end