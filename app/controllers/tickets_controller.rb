class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[ show ]

  def index
    @tickets = current_user.tickets.order("id desc")
  end

  def show
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)
    event = @ticket.event
    event.with_lock do
      respond_to do |format|
        if @ticket.save
          format.html { redirect_to tickets_path, notice: "Ticket was successfully created." }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { redirect_to event, alert: @ticket.errors.full_messages.join(', ') }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:event_id, :quantity)
    end
end
