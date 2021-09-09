require 'my_utilities'

class CardsController < ApplicationController
  # before_action :set_card, only: %i[ show edit update destroy ]
  include MyUtilities

  def index
    @cards = Card.all
     if @cards
      current_user
      render json: {
      cards: @cards
     }
    else
      render json: {
      status: 500,
      error: ['No card found']
    }
    end

  end

  def show
    @card = Card.find(params[:id])
    if @card
       render json: {
       card: @card,
       info: scrapper(@card.model)
    }
    else
       render json: {
       status: 500,
       errors: ['Card not found']
     }
    end
  end

  def new
    @card = Card.new
  end

  def edit
  end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)
    if @card.save
        render json: {
        status: :created,
        card: @card
    }
    else
       render json: {
       status: 500,
       errors: @card.errors.full_messages
    }
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    # @card.update card_params
    if @card.update card_params
        render json: {
        status: :updated,
        card: @card
    }
    else
       render json: {
       status: 500,
       errors: @card.errors.full_messages
    }
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    if @card.destroy
        render json: {
        status: :deleted,
        card: @card
    }
    else
       render json: {
       status: 500,
       errors: @card.errors.full_messages
    }
    end
  end

  private

  def set_card
      @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:model, :hashrate, :power, :gpu_maker)
  end

end
