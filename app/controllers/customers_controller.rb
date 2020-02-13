class CustomersController < ApplicationController
  def new
    customer = Customers.new
  end
end
