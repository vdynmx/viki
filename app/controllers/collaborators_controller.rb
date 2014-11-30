class CollaboratorsController < ApplicationController
  def create
     @wiki = Wiki.find(params[:wiki_id])
      current_user.wikis << @wiki
 
       flash[:notice] = "Collaborator added."
       redirect_to @wiki
  end
end