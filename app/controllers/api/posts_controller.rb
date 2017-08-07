class Api::PostsController < Api::ApplicationController
  before_action :authenticate

  def show
    respond_with post
  end

  private

  def post
    @post ||= current_user.posts.find(params[:id])
  end
end
