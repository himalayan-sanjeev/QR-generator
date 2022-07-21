class TicketsController < ApplicationController
  
  def index
    @tickets= Ticket.all
    @ticket = Ticket.new
  end
  
  def new 
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to root_path
    else
      render json: @ticket.errors
    end
  end
  
  def show
    @ticket = Ticket.find(params[:id])
    @info = @ticket.info
    @qrcode = RQRCode::QRCode.new(@info)
    
    @svg = @qrcode.as_svg(
      offset:0,
      color:'000',
      module_size:15,
      shape_rendering:'crispEdges'
    )
  end
  
  def download
    @ticket = Ticket.find(params[:id])
    send_data RQRCode::QRCode.new(@ticket.info.to_s).as_png(size: 300), type: 'image/png', disposition: 'attachment'
  end
  
  private
  def ticket_params
    params.require(:ticket).permit(:info)
  end
  
end
