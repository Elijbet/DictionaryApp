class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  before_action :tag_cloud

  before_action :word_array

  # GET /words
  # GET /words.json
  def index
    #@words = Word.all.order('created_at DESC').paginate(:page => params[:page])
    #@definitions = @words.each  {|word| word.definitions.order(:cached_votes_up => :desc)}


    if (params[:letter] != nil)
    @words = Word.all.order('created_at DESC').where("word like ?", params[:letter] +"%" ).paginate(:page => params[:page])
    # creates this /words?letter=i
    else
    @words = Word.all.order('created_at DESC').paginate(:page => params[:page])
    end


  end

  # GET /words/1
  # GET /words/1.json
  def show
    @definitions = @word.definitions.order(cached_votes_up: :desc, created_at: :desc)
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  def all_new

    @word = Word.new
    1.times { @word.definitions.build }
              #definition.create(definition: "stuff", word_id: @word)
              #word.definitions.build(definition: "stuff")
    @words = Word.all

  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create

    @word = Word.new(word_params)
    
    #@incoming_word = Word.new(word_params)
    #@word = Word.where(word: @incoming_word.word).first_or_create

    #@word = Word.where(word: word_params[:word]).first_or_create 

    #The first_or_create method checks whether first returns nil or not. 
    #If it does return nil, then create is called.


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

  def tag_cloud
    @tag = Word.tag_counts_on(:tags).order('count desc').limit(17)
  end

  def word_array
    # Create array consisting of the first letter of every visitor's last name
    @word_array = []
    @w = Word.all
    @w.each do |word|
        @word_array << word.word[0,1]
        end
    #Sort array alphabetically in ASC order
    @word_array.sort!
    #Remove duplicate elements
    @word_array.uniq!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:word, :tag_list, definitions_attributes: [:definition, :URL])
    end
end
