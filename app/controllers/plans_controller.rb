class PlansController < ApplicationController
  def new
    @plans = Plan.new
  end

  def create
    @wiki = current_user.wikis.build(params.require(:wiki).permit(:public == true))
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
      # report success
    else
      flash[:error] = "There was an error saving your wiki. Please try again."
      render :new

    #update the role model based on user selection
  end
end
end