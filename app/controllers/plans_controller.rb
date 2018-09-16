class PlansController < ApplicationController
  def index
    @plans = Plan.order(:name)
  end
end
