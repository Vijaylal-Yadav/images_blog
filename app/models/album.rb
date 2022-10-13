class Album < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :pictures, dependent: :destroy
end