class PagesController < ApplicationController
  
  def home
  end
  
  def qr_code_download
    send_data RQRCode::QRCode.new(params[:content].to_s).as_png(size: 300), type: 'image/png', disposition: 'attachment'
  end
  
  def qr_code_view
    #as PNG
    send_data RQRCode::QRCode.new(params[:content].to_s).as_png(size: 300), type: 'image/png', disposition: 'inline'    
    
    #as SVG
    # qr_code = RQRCode::QRCode.new(params[:content].to_s)
    # @svg = qr_code.as_svg(
    #   offset: 0,
    #   color: '000',
    #   shape_rendering: 'crispEdges',
    #   module_size: 6
    # )
  end
  
end
