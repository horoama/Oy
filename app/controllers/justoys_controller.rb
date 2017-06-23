class JustoysController < ApplicationController
  before_action :set_justoy, only: [:show, :edit, :update, :destroy]

  # GET /justoys
  # GET /justoys.json
  def index
    @justoys = Justoy.all
  end

  # GET /justoys/1
  # GET /justoys/1.json
  def show
  end

  # GET /justoys/new
  def new
    @justoy = Justoy.new
  end

  # GET /justoys/1/edit
  def edit
  end

  # POST /justoys
  # POST /justoys.json
  def create
    @justoy = Justoy.new(justoy_params)

    respond_to do |format|
      if @justoy.save
        format.html { redirect_to @justoy, notice: 'Justoy was successfully created.' }
        format.json { render :show, status: :created, location: @justoy }
      else
        format.html { render :new }
        format.json { render json: @justoy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /justoys/1
  # PATCH/PUT /justoys/1.json
  def update
    respond_to do |format|
      if @justoy.update(justoy_params)
        format.html { redirect_to @justoy, notice: 'Justoy was successfully updated.' }
        format.json { render :show, status: :ok, location: @justoy }
      else
        format.html { render :edit }
        format.json { render json: @justoy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /justoys/1
  # DELETE /justoys/1.json
  def destroy
    @justoy.destroy
    respond_to do |format|
      format.html { redirect_to justoys_url, notice: 'Justoy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_justoy
      @justoy = Justoy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def justoy_params
      params.require(:justoy).permit(:message)
    end
end
