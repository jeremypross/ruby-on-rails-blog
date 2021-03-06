class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def show
    #store as instance variables so you can access the nested post/:id/comments route in the form
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @comments = Post.find(params[:id]).comments
  end

  # used this SO article for reference: http://stackoverflow.com/questions/2034700/form-for-with-nested-resources

  def create
    #mass assignment of parameters - so you don't have to code these out by hand every time
    post = Post.create(post_params)

    # redirect to /posts via route prefix as defined by "resources :posts" (posts rake routes)
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post_updated = Post.find(params[:id]).update_attributes(post_params)
    redirect_to posts_path
  end

  def destroy
    destroyed_post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
  # "strong parameters" used in mass-assignment as per above code
  # also increases security - we will only support these parameters - server will not recognize other parameters than these listed below:
  def post_params
    params
    .require(:post)
    .permit(:post_text, :title, :post_image)
  end

end


# if model method is empty - renders template
# for create - we need some functionality
