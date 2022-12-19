class Favorite < ApplicationRecord

  belongs_to :user #モデル名
  belongs_to :post_image
  # モデルを関連付ける記述

end
