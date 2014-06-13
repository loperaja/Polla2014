class PollasController < ApplicationController
  include PollasHelper
  respond_to :html, :js
  before_action :set_polla, only: [:show, :edit, :rename, :update, :destroy, :can_modify, :modification_allowed]
  before_action :row_ids, only: [:edit, :update]
  before_filter :can_access, only: [:edit, :update, :show]
  before_filter :modification_allowed, only: [:edit, :update, :destroy]
  
  
  def show
  end
  
  def index
    @pollas = Polla.where(real: nil).order(points: :desc)
    respond_to do |format|
      format.html
      format.xls
      format.js
    end
  end
  
  def new
    @polla = Polla.new
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def create
    @polla = current_user.pollas.new(polla_params)
    if @polla.save
      flash.now[:success] = "Polla creada exitosamente"
    else
      render 'new'
    end
  end
  
  def destroy
    @polla.destroy
    flash.now[:warning] = "La polla ha sido eliminada"
  end
  
  def rename
  end
  
  def edit
  end
  
  def update
    if @polla.update_attributes(polla_params)
      flash.now[:success] = "Resultados Ingresados Exitosamente"
    else
      @matches = Match.all
      flash.now[:danger] = "Verifique sus datos"
      render 'edit'
    end
  end
  
  def notify
    @polla = Polla.find(params[:id])
    PollaMailer.payment_notification(@polla).deliver
  end
    
  private
  
  def set_polla
    @polla = Polla.find(params[:id])
  end
  
  def polla_params
    params.require(:polla).permit(:name, :polla_section, :round_id,
                                  :match_results_attributes => [:id, :match_id, :result, :_destroy],
                                  :group_positions_attributes => [:id, :team_id, :position_id],
                                  :qualifieds_attributes => [:id, :team_id],
                                  :final_positions_attributes => [:id, :team_id])
  end
  
  def modification_allowed
    if Time.now > Time.new(2014, 06, 12, 21, 45, 0) && !@polla.real? 
      redirect_to root_path 
      flash[:warning] = "El mundial ya empezó!!"
    end
  end
  
  def can_access
    right_user(@polla)
  end
    
end
