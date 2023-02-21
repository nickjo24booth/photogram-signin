class LikesController < ApplicationController
  def create
    like = Like.new

    like.fan_id = session.fetch(:user_id)
    like.photo_id = params.fetch("query_photo_id")

    like.save

    redirect_to("/photos/#{like.photo_id}")
  end

  def destroy
    photo_id = params.fetch("query_photo_id")
    user_id = session.fetch(:user_id)

    like = Like.where({ :photo_id => photo_id }).where({ :fan_id => user_id }).at(0)

    like.destroy

    redirect_to("/photos/#{photo_id}")
  end
end
