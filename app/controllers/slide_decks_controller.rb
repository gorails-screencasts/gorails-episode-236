class SlideDecksController < ApplicationController
  before_action :set_slide_deck, only: [:show, :edit, :update, :destroy]

  # GET /slide_decks
  # GET /slide_decks.json
  def index
    @slide_decks = SlideDeck.all
  end

  # GET /slide_decks/1
  # GET /slide_decks/1.json
  def show
  end

  # GET /slide_decks/new
  def new
    @slide_deck = SlideDeck.new
  end

  # GET /slide_decks/1/edit
  def edit
  end

  # POST /slide_decks
  # POST /slide_decks.json
  def create
    @slide_deck = SlideDeck.new(slide_deck_params)

    respond_to do |format|
      if @slide_deck.save
        format.html { redirect_to @slide_deck, notice: 'Slide deck was successfully created.' }
        format.json { render :show, status: :created, location: @slide_deck }
      else
        format.html { render :new }
        format.json { render json: @slide_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slide_decks/1
  # PATCH/PUT /slide_decks/1.json
  def update
    respond_to do |format|
      if @slide_deck.update(slide_deck_params)
        format.html { redirect_to @slide_deck, notice: 'Slide deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @slide_deck }
      else
        format.html { render :edit }
        format.json { render json: @slide_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slide_decks/1
  # DELETE /slide_decks/1.json
  def destroy
    @slide_deck.destroy
    respond_to do |format|
      format.html { redirect_to slide_decks_url, notice: 'Slide deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide_deck
      @slide_deck = SlideDeck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_deck_params
      params.require(:slide_deck).permit(:name, :presentation)
    end
end
