class Api::PostsController < Api::ApplicationController
  before_action :authenticate

  def index
    respond_with posts
  end

  def create
    # The responders gem and respond_with works like the following:
    #
    # POST:
    #   Render 201 Created response.
    #   Set Location header to the location of the newly created resource.
    #
    # PUT:
    #   Render 204 No Content response.
    #   Won't render any responses. You can override that with a custom
    #   responder object.
    respond_with posts.create!(post_params), location: nil
  end

  def show
    respond_with post
  end

  private

  def posts
    @posts ||= current_user.posts
  end

  def post
    @post ||= posts.find(params[:id])
  end

  def post_params
    params.permit(:title, :description)
  end
end
