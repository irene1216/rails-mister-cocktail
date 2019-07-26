class Cocktail < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    where('lower(name) LIKE ?', "%#{search.downcase}%")
  end

  def self.random
    where(random: true).order('id DESC')
  end
end
