class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show]

  def show
    render json: @collection
  end

  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      render json: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def index
    @collections = Collection.all
    render json: @collections
  end

  private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:hashtag, :start_date, :end_date)
    end
end
