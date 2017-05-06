class Category < ApplicationRecord
  has_many :foods, dependent: :nullify
  validates :title, presence: true

end
