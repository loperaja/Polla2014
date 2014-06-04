class UserCommentsController < ApplicationController
  respond_to :html, :js
  before_action :set_user_comments, only: [:show, :edit, :update, :destroy]
  
  def create
    @user_comment = current_user.user_comments.new(user_comment_params)
    if @user_comment.save
      flash.now[:success] = "Comentario publicado exitosamente"
    end
  end
  
  def destroy
    @user_comment.destroy
    flash.now[:warning] = "El comentario ha sido eliminado"
  end
  
  def edit
  end
  
  def update
    @user_comment.update_attributes(user_comment_params)
  end
  
  
  
    private
  
    def set_user_comments
      @user_comment = UserComment.find(params[:id])
    end
  
    def user_comment_params
      params.require(:user_comment).permit(:comment)
    end
  
end
