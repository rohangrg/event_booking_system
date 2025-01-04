class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :ticket_availability

  before_save :update_event_available_tickets

  def ticket_availability
    if quantity > event.available_tickets
      errors.add(:quantity, "exceeds available tickets")
    end
  end

  def update_event_available_tickets
    event.update_event_available_tickets(quantity)
  end
end