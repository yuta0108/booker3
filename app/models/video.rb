class Video < ApplicationRecord
  #「投稿する動画は1回で１つ」
  has_one_attached :video
end
