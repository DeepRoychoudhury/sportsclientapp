class SportskitsController < ApplicationController
  before_action :set_sportskit, only: [:show, :edit, :update, :destroy]

  # GET /sportskits
  # GET /sportskits.json
  def index
    @sportskits = Sportskit.all
  end

  # GET /sportskits/1
  # GET /sportskits/1.json
  def show
  end

  # GET /sportskits/new
  def new
  unless current_user && current_user.admin?
    render :text => "Access Error Message", :status => :unauthorizedend
  else  
    @sportskit = Sportskit.new
  end
  end

  # GET /sportskits/1/edit
  def edit
  end

  def buy
    @sportskit = Sportskit.find(params[:sportskit_id])
    @sportskit_id=params[:sportskit_id]
    @invoicenum = Invoice.maximum("invoicenumber")
    if @invoicenum == nil
      @invoicenum=1
      @invoice=Invoice.new(:invoicenumber => @invoicenum, :product_id => @sportskit_id)
      @invoice.save
    else
      @invoicenum=@invoicenum+1      
      @invoice=Invoice.new(:invoicenumber => @invoicenum, :product_id => @sportskit_id)
      @invoice.save
    end
    @url = "https://hotelapi20200806072002.azurewebsites.net/invoice/getitems?invoiceNumber="+@invoicenum.to_s+"&customerName="+current_user.email.to_s+"&productName="+@sportskit.kit.to_s+"&productName=&productPrice="+@sportskit.currency.to_s+" "+@sportskit.price.to_s+"&productPrice=&totalAmt="+@sportskit.price.to_s+"&balanceAmt=5&transactionType=Credit/Debit_Card&siteName=SportsClientApp"
    
  end  

  # POST /sportskits
  # POST /sportskits.json
  def create
    @sportskit = Sportskit.new(sportskit_params)
    respond_to do |format|
      if @sportskit.save
        format.html { redirect_to @sportskit, notice: 'Sportskit was successfully created.' }
        format.json { render :show, status: :created, location: @sportskit }
      else
        format.html { render :new }
        format.json { render json: @sportskit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sportskits/1
  # PATCH/PUT /sportskits/1.json
  def update
    respond_to do |format|
      if @sportskit.update(sportskit_params)
        format.html { redirect_to @sportskit, notice: 'Sportskit was successfully updated.' }
        format.json { render :show, status: :ok, location: @sportskit }
      else
        format.html { render :edit }
        format.json { render json: @sportskit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sportskits/1
  # DELETE /sportskits/1.json
  def destroy
    @sportskit.destroy
    respond_to do |format|
      format.html { redirect_to sportskits_url, notice: 'Sportskit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sportskit
      @sportskit = Sportskit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sportskit_params
      params.require(:sportskit).permit(:sport_id, :kit, :currency, :price)
    end
end
