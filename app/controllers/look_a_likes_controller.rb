class LookALikesController < ApplicationController
  before_action :set_look_a_like, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :show]

  # GET /look_a_likes or /look_a_likes.json
  def index
    @look_a_likes = LookALike.all
  end

  # GET /look_a_likes/1 or /look_a_likes/1.json
  def show
  end

  # GET /look_a_likes/new
  def new
    @look_a_like = LookALike.new
  end

  # GET /look_a_likes/1/edit
  def edit
  end

  # POST /look_a_likes or /look_a_likes.json
  def create
    @look_a_like = LookALike.new(look_a_like_params)

    respond_to do |format|
      if @look_a_like.save
        format.html { redirect_to @look_a_like, notice: "Look a like was successfully created." }
        format.json { render :show, status: :created, location: @look_a_like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @look_a_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /look_a_likes/1 or /look_a_likes/1.json
  def update
    respond_to do |format|
      if @look_a_like.update(look_a_like_params)
        format.html { redirect_to @look_a_like, notice: "Look a like was successfully updated." }
        format.json { render :show, status: :ok, location: @look_a_like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @look_a_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /look_a_likes/1 or /look_a_likes/1.json
  def destroy
    @look_a_like.destroy
    respond_to do |format|
      format.html { redirect_to look_a_likes_url, notice: "Look a like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_look_a_like
      @look_a_like = LookALike.find(params[:id])
      @images = @look_a_like.images
    end

    

    # Only allow a list of trusted parameters through.
    def look_a_like_params
      params.require(:look_a_like).permit(:first_name, :last_name, images: [])
    end
end


