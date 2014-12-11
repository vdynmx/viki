class Wikis::CollaboratorsController < ApplicationController

 # def create
 #    @wiki = Wiki.find(params[:wiki_id])
 #     current_user.wikis << @wiki
 #
 #      flash[:notice] = "Collaborator added."
 #      redirect_to @wiki
  #end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @email = params[:user][:email]
    @user = User.where(email: @email).first if @email

    if @collaborator
      @collaborator.save
      redirect_to @wiki, notice: 'Collaborator added!'
    else
      flash[:error] = 'Collaborator failed. Please try again.'
      redirect_to @wiki
    end
  end

end