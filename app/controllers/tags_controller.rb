class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @blogs = @tag.blogs
  end
end
