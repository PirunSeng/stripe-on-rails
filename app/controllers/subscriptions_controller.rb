class SubscriptionsController < ApplicationController
  before_action :find_plan
  before_action :find_subscription, only: [:show, :edit, :update]

  def show
  end

  def new
    @subscription = @plan.subscriptions.new
  end

  def create
    @subscription = @plan.subscriptions.new(subscription_params)
    if @subscription.save_with_token
      redirect_to [@plan, @subscription], notice: 'Success!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subscription.update(subscription_params)
      redirect_to [@plan, @subscription], notice: 'Success!'
    else
      render :edit
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :email, :stripe_card_token)
  end

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end

  def find_subscription
    @subscription = @plan.subscriptions.find(params[:id])
  end
end
