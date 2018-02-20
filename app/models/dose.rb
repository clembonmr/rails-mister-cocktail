class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  # validating unique ingredient/cocktail pair
  validates :ingredient, uniqueness: { scope: :cocktail }
end
