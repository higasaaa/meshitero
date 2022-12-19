class UsersController < ApplicationController
  # "edit"と"update"のアクションの実行前に、"is_matching_login_user"を実行
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    # メソッドで処理をまとめたことで、同じ処理を記述しているところは、以下のように置き換えられる
  # is_matching_login_user
  @user = User.find(params[:id])
  end

  def update
    # user_id = params[:id].to_i
    # login_user_id = current_user.id
    # if(user_id != login_user_id)
    #   redirect_to post_images_path

    # 上記コメントは下記のように省略できる
    # is_matching_login_user. 上のbefore_action記述したから消す
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

# 省略バーっジョンを書くには下記の記述が必要
  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to post_images_path
    end
  end
end
