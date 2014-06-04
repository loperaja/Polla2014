class MatchResultsController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  include MatchResultsHelper
  before_action :row_ids, only: [:new, :edit, :create]

  # GET /users
  # GET /users.json
  def index
    @match_results = MatchResult.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /match_results/new
  def new
    @groups = Group.all
    @match_results = Array.new
    Match.all.each{|m| @match_results << m.match_results.build }
  end

  # GET /match_results/1/edit
  def edit
  end

  # POST /match_results
  # POST /match_results.json
  def create
    @match_results = params[:match_results].values.collect {|result| MatchResult.new(result)}

    respond_to do |format|
      if @match_results.all?(&:valid?)
        @match_results.each(&:save!)
        format.html { redirect_to match_results_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        flash.now[:danger] = "Verifique los datos ingresados"
        format.html { render action: 'new' }
        format.json { render json: @match_results.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_results_params
      params.require(:match_results).permit(:id, :result, :match_id)
    end
end
