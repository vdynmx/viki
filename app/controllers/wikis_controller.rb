class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
  end
  
  def new
    @wiki = Wiki.new
      authorize @wiki
  end
  
  def create
    @wiki = current_user.wikis.build(params.require(:wiki).permit(:title, :body, :public))
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
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

   def destroy
     @wiki = Wiki.find(params[:id])
     name = @wiki.name
 
     authorize @wiki
     if @wiki.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
   end



end
