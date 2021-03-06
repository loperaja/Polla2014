class UsersController < ApplicationController
  layout 'static_layout', :only => [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :can_modify]
  skip_before_filter :signed_in_user , :only => [:new, :create]
  before_filter :can_modify, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @pollas_score = Polla.where(real: nil).order(points: :desc)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to @user, notice: 'Usuario creado exitosamente' }
        format.json { render action: 'show', status: :created, location: @user }
        PollaMailer.welcome_email(@user).deliver
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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

  #def destroy
   # @user.destroy
    #respond_to do |format|
     # format.html { redirect_to users_url }
      #format.json { head :no_content }
      #end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation, :email_confirmation, :num_pollas)
    end
    
    def can_modify
      redirect_to current_user_path if current_user != @user
    end
end
