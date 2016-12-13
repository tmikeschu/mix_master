class Artist < ActiveRecord::Base
  validates :name, presence: true
  validates :image_path, presence: true
end