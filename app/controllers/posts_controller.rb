class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    render "index.html.erb"
  end

  def show
    @post = Post.find(params[:id])
    render "show.html.erb"
  end

  def new
    @post = Post.new
  end

  def edit
    render "new.html.erb"
  end

  def create
    @post = Post.new( 
      name: params[:name],
      title: params[:title],
      contant: params[:content],
      )

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # private
    
  #   def set_post
  #     @post = Post.find(params[:id])
  #   end

  
  #   def post_params
  #     params.require(:post).permit(:name, :title, :content)
  #   end
end
