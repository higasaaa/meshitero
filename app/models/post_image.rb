class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true #presence（存在）をチェック
  validates :image, presence: true #trueと記述すると、データが存在しなければならないという設定

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

# favorited_by? 引数で渡されたユーザidがFavoritesテーブル内に存在(exists？)するか調べる
# 存在していればtrue 存在していなければfalse
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
