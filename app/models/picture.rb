class Picture < ApplicationRecord
  validates :tag_line, presence: true
end