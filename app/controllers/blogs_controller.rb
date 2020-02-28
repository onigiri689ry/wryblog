class BlogsController < ApplicationController

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @tags = Tag.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    tag_list = params[:blog][:tag_name].split(",")
    respond_to do |format|
      if @blog.save
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
    @blog = Blog.find(params[:id])
    @comment = Comment.new
    @comments = @blog.comments.includes(:user)
  end

  def search
    @blogs = Blog.search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
  end

  def edit
    @blog = Blog.find(params[:id])
    @tag_list = @blog.tags.pluck(:tag_name).join(",")
  end

  def update
    @blog = Blog.find(params[:id])
    tag_list = params[:blog][:tag_name].split(",")
    respond_to do |format|
      if @blog.update(blog_params)
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
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_path
  end


  private
  def blog_params
    params.require(:blog).permit(:title, :body,).merge(user_id: current_user.id)
  end

end
