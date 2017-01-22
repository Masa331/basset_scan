class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def homepage
  end

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new

    if @invoice.update(invoice_params)
      redirect_to invoice_path(@invoice.id)
    else
      render :new
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])

    if @invoice.destroy
      redirect_to invoices_path
    else
      render :new
    end
  end

  def detect
    respond_to do |format|
      format.js do
        tlc = params[:tlc].split('x')
        brc = params[:brc].split('x')
        hash = { detected: detect_text(tlc, brc) }

        render json: hash
      end
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit!
  end

  def detect_text(tlc, brc)
    starting_x = Float(tlc[0]).to_i - 6 # css
    starting_y = Float(tlc[1]).to_i - 6 # css

    width = Float(brc[0]).to_i - Float(tlc[0]).to_i
    height = Float(brc[1]).to_i - Float(tlc[1]).to_i

    path = '/home/masa331/pracovni/rails_apps/basset_scan/app/assets/images/faktura.png'

    image = MiniMagick::Image.open(path)

    cropped_path = Rails.root.join('app', 'assets', 'images', 'cropped.png')

    image.combine_options do |im|
      im.crop("#{width}x#{height}+#{starting_x}+#{starting_y}")
      im.write(cropped_path.to_s)
    end

    tesseract = Tesseract::Engine.new { |tes| tes.language  = :ces }
    text = tesseract.text_for(cropped_path.to_s).strip
    text
  end
end
