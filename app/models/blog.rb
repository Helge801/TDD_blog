class Blog < ApplicationRecord
  validates_presence_of :title, :image, :description
  has_many :post
end
