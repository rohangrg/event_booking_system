class Event < ApplicationRecord
  belongs_to :user

  has_many :tickets, dependent: :destroy

  validates :name, :description, :location, :event_start_time, :total_tickets, presence: true
  validates :total_tickets, numericality: { greater_than_or_equal_to: 0 }

  before_create :set_available_tickets

  def set_available_tickets
    self.available_tickets = total_tickets
  end

  def update_event_available_tickets(quantity)
    self.update(available_tickets: available_tickets - quantity)
  end

end