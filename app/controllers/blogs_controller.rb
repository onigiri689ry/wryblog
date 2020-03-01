class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(3)
    @tags = Tag.all
  end

  def new
    @blog = Blog.new
    5.times { @blog.images.build }
  end

  def create
    @blog = Blog.new(blog_params)
    tag_list = params[:blog][:tag_name].split(",")
    respond_to do |format|
      if @img_attr.present? && @blog.save
        @blog.save_blogs(tag_list)
        format.html { redirect_to @blog, notice: '記事を投稿しました' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @comment = Comment.new
    @comments = @blog.comments.includes(:user)
  end

  def search
    @blogs = Blog.search(params[:search]).order("created_at DESC").page(params[:page]).per(3)
  end

  def edit
    @tag_list = @blog.tags.pluck(:tag_name).join(",")

    image_amount = 5
    image_amount.freeze
    num = image_amount - (@blog.images.length)
    num.times { @blog.images.build }
  end

  def update
    tag_list = params[:blog][:tag_name].split(",")
    respond_to do |format|
      if @blog.update(update_params) && params.require(:blog).keys[0] == "images_attributes"
        @blog.save_blogs(tag_list)
        format.html { redirect_to @blog, notice: '記事を編集しました' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @blog.user_id == current_user.id
      @blog.destroy
      redirect_to "/"
    else
      redirect_to show_blog_path(blog)
    end
  end


  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    @img_attr = params[:blog][:images_attributes]
    params.require(:blog).permit(:title, :body, images_attributes: [:image_url]).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:blog).permit(:title, :body, images_attributes: [:image_url,:id]).merge(user_id: current_user.id)
  end

end
