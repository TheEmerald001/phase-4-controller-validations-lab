class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :post_invalid

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update(post_params)

    render json: post
  end

  private
  private
  def post_invalid(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def post_params
    params.permit(:category, :content, :title)
  end

end
