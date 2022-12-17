class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params) #投稿するデータをPostImageモデルに紐づくデータとして保存する準備を行い、フォームに入力されたデータ(shop_name,caption,imageなど)が@post_imageに格納されることになっている
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
  end

  # 自動生成されていなかった追加した
  def destroy
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
