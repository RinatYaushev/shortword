class PostsController < ApplicationController
  load_and_authorize_resource

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.includes(:author)
                  .order(created_at: :desc)
                  .paginate(page: params[:page], per_page: 4)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.includes(:user)
                              .paginate(page: params[:page], per_page: 3)
  end

  # GET /posts/new
  def new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    if @post.save
      redirect_to root_path, notice: t('.notice_create')
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to root_path, notice: t('.notice_update')
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy

    redirect_to root_path, alert: t('.notice_destroy')
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
