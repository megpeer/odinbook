class PostsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    @pagy, @posts = pagy(
                    Post.includes(:user).order(created_at: :desc),
                    items: 10,
                    limit: 10
                    )


      render partial: "posts/page",
            locals: { posts: @posts, pagy: @pagy, path: ->(opts) { posts_path(opts) } }
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.includes(likes: :user).find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    render :edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
        if @post.save
          format.html { redirect_to root_path }
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.prepend(
              "posts",
              partial: "posts/post",
              locals: { post: @post }),
              turbo_stream.replace(
              "post_form",
              partial: "posts/form",
              locals: { post: Post.new }
            )
          ]
          end
        else
          format.html { render :new, status: :unprocessable_entity }
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
            "post_form",
            partial: "posts/form",
            locals:  { post: @post }
            )
          end
        end
    end
  end
  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            dom_id(@post),
            partial: "posts/post",
            locals: { post: @post }
          )
        end
        format.html { redirect_to @post }
      else
        format.html { render :edit, status: :unprocessable_entity }

        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
          @post,
          partial: "posts/form",
          locals: { post: @post }
          )
        end
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(dom_id(@post))
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.require(:id))
    end

    def correct_user
      unless @post.user == current_user
        redirect_to root_path, alert: "You are not authorized to edit this post."
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:text)
    end
end
