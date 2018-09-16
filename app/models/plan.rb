class Plan < ActiveRecord::Base
  has_many :subscriptions, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { integer: true }
end
