class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
    #@wikis = Wiki.all
    #@wikis = current_user.nil? ? Wiki.public : Wiki.visible_to(current_user)
    #@wikis = Wiki.visible_to(current_user)
     #authorize @wikis 
        
  end

  def show
    @wiki = Wiki.where(:slug => params[:id].to_s).first
  end
  
  def new
    @wiki = Wiki.new
      authorize @wiki
  end
  
  def create
    @wiki = current_user.wikis.build(params.require(:wiki).permit(:title, :body, :private, :user))
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
      # report success
    else
      flash[:error] = "There was an error saving your wiki. Please try again."
      render :new

    end

  end

  def edit
    @wiki = Wiki.find(params[:id])
     authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
     authorize @wiki
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :private, :user))
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

   def destroy
     @wiki = Wiki.find(params[:id])
     title = @wiki.title
 
     authorize @wiki
     if @wiki.destroy
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
   end



end
