class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /words
  # GET /words.json
  def index
    @words = Word.all.order('created_at DESC').paginate(:page => params[:page])
    #@definitions = @words.each  {|word| word.definitions.order(:cached_votes_up => :desc)}

  end

  # GET /words/1
  # GET /words/1.json
  def show
    @definitions = @word.definitions.order(:cached_votes_up => :desc)
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  def all_new
    @word = Word.new
    1.times { @word.definitions.build }
    @words = Word.all
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    #@word = Word.new(word_params)
    #@incoming_word = Word.new(word_params)
    #@word = Word.where(word: @incoming_word.word).first_or_create

    # @word = Word.where(word: word_params[:word]).first_or_create do |word|
    #   word.attributes = word_params
    # end

    #The first_or_create method checks whether first returns nil or not. 
    #If it does return nil, then create is called.

    @word = Word.find_or_create_by(word: word_params[:word]) do |word|
      word.attributes = word_params
    end

    #Finds the first record with the given attributes, or creates a record with 
    #the attributes if one is not found:

    # Find the first user named "Scarlett" or create a new one with a
    # different last name.
    # User.find_or_create_by(first_name: 'Scarlett') do |user|
    #   user.last_name = 'Johansson'
    # end
    # => #<User id: 2, first_name: "Scarlett", last_name: "Johansson">

    @word.user_id = current_user.id

    #@word =  current_user.words.new(word_params)
    @word.definitions.each  {|definition| definition.user_id = current_user.id }

    respond_to do |format|
      if Word.where(word: word_params[:word]).present?
        format.html { redirect_to root_path, notice: 'Word already exists.' }
      elsif @word.save
        format.html { redirect_to root_path, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to root_path, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:word, definitions_attributes: [:definition, :URL])
    end
end
