class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: { 
    active: 0,
    cancelled: 1
  }

  validate :ticket_availability

  before_save :update_event_available_tickets

  def ticket_availability
    return if !active?

    if quantity > event.available_tickets
      errors.add(:quantity, "exceeds available tickets")
    end
  end

  def update_event_available_tickets
    final_quantity = cancelled? ? -1 * self.quantity : self.quantity
    event.update_event_available_tickets(final_quantity)
  end
end