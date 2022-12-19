class PostComment < ApplicationRecord

  belongs_to :user_params
  belongs_to :post_image_params

end
