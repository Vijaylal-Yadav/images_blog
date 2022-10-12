class Album < ApplicationRecord
  validates :name, presence: true
end