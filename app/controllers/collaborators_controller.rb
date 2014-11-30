class CollaboratorsController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)
 
     if favorite.save
       # Add code to generate a success flash and redirect to @post
       # Remember the path shortcut: [@post.topic, @post]
     else
       # Add code to generate a failure flash and redirect to @post
     end
  end
end