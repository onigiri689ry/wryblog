class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @blogs = @tag.blogs.order("created_at DESC").page(params[:page]).per(3)
  end
end
