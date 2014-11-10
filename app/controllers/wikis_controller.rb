class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end
  
  def new
  end
  
  def create
    @wiki = current_user.wikis.build(wiki_params)

    if @wiki.save
      # report success


    end

    # report error
    redirect_to wikis_path
  end

  def about
  end
end
