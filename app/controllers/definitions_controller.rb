class DefinitionsController < ApplicationController
  before_action :set_definition, only: [:show, :edit, :update, :destroy]
  before_action :set_word


  # GET /definitions
  # GET /definitions.json
  def index
    @definitions = Definition.all.limit(1)
  end

  # GET /definitions/1
  # GET /definitions/1.json
  def show
  end

  # GET /definitions/new
  def new
    @definition = Definition.new
  end

  # GET /definitions/1/edit
  def edit
  end

  # POST /definitions
  # POST /definitions.json
  def create
    @definition = Definition.new(definition_params)
    definition.user_id == current_user.id

    respond_to do |format|
      if @definition.save
        format.html { redirect_to @definition, notice: 'Definition was successfully created.' }
        format.json { render :show, status: :created, location: @definition }
      else
        format.html { render :new }
        format.json { render json: @definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /definitions/1
  # PATCH/PUT /definitions/1.json
  def update
    respond_to do |format|
      if @definition.update(definition_params)
        format.html { redirect_to @definition, notice: 'Definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @definition }
      else
        format.html { render :edit }
        format.json { render json: @definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /definitions/1
  # DELETE /definitions/1.json
  def destroy
    @definition.destroy
    respond_to do |format|
      format.html { redirect_to definitions_url, notice: 'Definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition
      @definition = Definition.find(params[:id])
    end

    def set_word
      @word = Word.find(params[:word_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def definition_params
      params.require(:definition).permit(:word, :definition, :URL)
    end
end
