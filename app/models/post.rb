class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates_length_of :title, minimum: 7

  validates :description, presence: true
end
