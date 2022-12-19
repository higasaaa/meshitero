class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params) #投稿するデータをPostImageモデルに紐づくデータとして保存する準備を行い、フォームに入力されたデータ(shop_name,caption,imageなど)が@post_imageに格納されることになっている
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    #gemでkaminariをインストールしたからpageメソッドが使用可能
    # １ページ分の決められた数のデータだけを新しい順で取得できる
    @post_images = PostImage.page(params[:page]) 
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  # 自動生成されていなかった追加した
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
