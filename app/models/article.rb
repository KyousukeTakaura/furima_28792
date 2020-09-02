class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :purchase

  # 空の投稿を保存できないようにする
  validates :title, :text, :purchase, presence: true

  # 選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :purchase_id
  end
end
