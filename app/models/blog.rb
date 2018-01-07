class Blog < ApplicationRecord
  validates_presence_of :title, :image, :description
end
