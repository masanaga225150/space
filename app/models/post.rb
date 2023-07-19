class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  # belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :title, :text, presence: true
end
