class Subscription < ActiveRecord::Base
  belongs_to :plan

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :plan, presence: true

  attr_accessor :stripe_card_token

  def save_with_token
    if valid?
      charge = Stripe::Charge.create(
        amount: plan.price * 100,
        currency: 'usd',
        description: email,
        source: stripe_card_token
      )
      self.stripe_customer_token = charge.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error 'Stripe error while creating charge: #{e.message}'
    errors.add :base, 'There was a broblem with your credit card.'
    false
  end
end
