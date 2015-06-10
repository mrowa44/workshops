class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :description, presence: true
  validates :title, presence: true
  validates :price, presence: true, format: { with: /\A\d+(\.\d{1,2})?\z/ }

  def average_rating
    reviews.average(:rating)
  end
end
