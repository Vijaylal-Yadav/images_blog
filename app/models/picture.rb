class Picture < ApplicationRecord
  validates :tag_line, presence: true
  belongs_to :album
end