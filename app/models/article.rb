class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :brief_description, presence: true
  validates :full_content, presence: true
end
