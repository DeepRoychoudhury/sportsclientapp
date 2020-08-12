class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  # GET /templates
  # GET /templates.json
  def index
    begin
    @templates = Template.all
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    begin
    @template = Template.new
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # GET /templates/1/edit
  def edit
  end

  # POST /templates
  # POST /templates.json
  def create
    begin
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    begin
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    begin
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def template_params
      params.require(:template).permit(:title, :desc)
    end
end
