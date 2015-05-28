class CommentsController < ApplicationController
  before_action :prepare_post

  load_and_authorize_resource

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    if @comment.save
      redirect_to root_path, notice: t('.notice_create')
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to root_path, notice: t('.notice_update')
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy

    redirect_to root_path, alert: t('.notice_destroy')
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
          .merge(post: @post, user: current_user)
  end

  def prepare_post
    @post = Post.find(params[:post_id])
  end
end
