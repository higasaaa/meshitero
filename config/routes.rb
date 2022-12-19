Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get '/homes/about' => "homes#about" ,as: "about"

# コメントは投稿画像に対してコメントされる。そのためpost_commentはpost_imagesに結びつく。⇨親子関係
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]   #resourceにするとURLにidが表示されなくなる いいねは1投稿につき1回だからidはURLに含めなくていい
  # resourceは「それ自身のidが分からなくても、関連する他のモデルのidから特定できる」といった場合に用いることが多い
    resources :post_comments, only: [:create, :destroy]
    
# モデルを追加したらルーディング追加
  end

  resources :users,only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

